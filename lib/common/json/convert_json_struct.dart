import 'dart:convert';
import 'dart:io';

import 'package:convert_structure_to_json/models/structure/structure.dart';
import 'package:convert_structure_to_json/validator/validator.dart';

class ConvertJsonStruct {
  static String getProjectPath(String filePath) {
    try {
      Directory current = Directory.current;

      while (!File('${current.path}/pubspec.yaml').existsSync()) {
        current = current.parent;
      }
      return current.path;
    } catch (e) {
      stderr.writeln('error $e');
      return '';
    }
  }

  static String getProjectStructToJson(String rootProject) {
    final listDir = getListDir(rootProject, rootProject);

    Map<String, dynamic> map = {};

    for (var item in listDir) {
      map.putIfAbsent(item.name, () => item.toJson());
    }
    return jsonEncode(map);
  }

  static List<Structure> getListDir(String path, String rootPath) {
    Directory current = Directory(path);

    List<FileSystemEntity> entities = current.listSync();
    List<Structure> children = [];

    for (FileSystemEntity entity in entities) {
      if (isInvalidFileName(entity.path.split('/').last)) {
        continue;
      }
      String type = FileSystemEntity.typeSync(entity.path) ==
              FileSystemEntityType.directory
          ? 'directory'
          : 'file';

      if (type == 'directory') {
        final child = getListDir(entity.path, rootPath);
        children.add(FolderStruct(
          name: entity.path.split('/').last,
          path: entity.path.replaceFirst(rootPath, ''),
          children: child,
        ));
      } else {
        children.add(FileStruct(
          name: entity.path.split('/').last,
          path: entity.path.replaceFirst(rootPath, ''),
        ));
      }
    }
    return children;
  }

  static bool isInvalidFileName(String name) {
    if (Validator.isInvalidFileExtension(name) ||
        Validator.isInvalidFolderName(name)) {
      return true;
    }
    return false;
  }
}
