abstract class Structure {
  String type, name, path;
  List<Structure>? children;

  Structure(
      {required this.type,
      required this.name,
      required this.path,
      this.children});

  factory Structure.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    String name = json['name'];
    String path = json['path'];
    final childrenJson = json['children'] ?? [];
    List<Structure> children = childrenJson
        .map<Structure>((childJson) => Structure.fromJson(childJson))
        .toList();

    return type == 'directory'
        ? FolderStruct(name: name, path: path, children: children)
        : FileStruct(
            url: json['url'],
            name: name,
            path: path,
          );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'path': path,
      'children': children?.map((child) => child.toJson()).toList(),
    };
  }

  List<Map<String, dynamic>> convertChildren(List<Structure> list) {
    if (list.isEmpty) return [];
    List<Map<String, dynamic>> listMap = [];
    for (var item in list) {
      listMap.add(item.toJson());
    }
    return listMap;
  }

  String getAbsolutePath(String absolutePath, String path) {
    return '$absolutePath/$path';
  }

  static List<Structure> mapToStructure(Map<String, dynamic> map) {
    List<Structure> children = [];
    map.forEach((name, data) {
      children.add(Structure.fromJson(data));
    });
    return children;
  }
}

class FolderStruct extends Structure {
  FolderStruct(
      {required String name, required String path, List<Structure>? children})
      : super(type: 'directory', name: name, path: path, children: children);
}

class FileStruct extends Structure {
  String? url;

  FileStruct({this.url, name, path})
      : super(type: 'file', name: name, path: path, children: null);
}
