import 'dart:io';

import 'package:convert_structure_to_json/command/command_method.dart';
import 'package:convert_structure_to_json/common/json/convert_json_struct.dart';
import 'package:convert_structure_to_json/text/text_log.dart';

class CreateStructure extends CommandMethod {
  @override
  Future execute(values) async {
    try {
      stdout.writeln(TextLog.log(
        colorName: ColorName.blue,
        text: 'Generating...',
      ));
      final path =
          ConvertJsonStruct.getProjectPath(Directory.current.absolute.path);

      final json = ConvertJsonStruct.getProjectStructToJson(path);
      File file = File('$path/structure.json');
      await file.writeAsString(json);
      stdout.writeln(TextLog.log(
        colorName: ColorName.green,
        text: 'Generate succeed: ${file.absolute.path.substring(1)}',
      ));
    } catch (e) {
      stdout.writeln(TextLog.log(
        colorName: ColorName.red,
        text: 'Generate error! $e',
      ));
    }
  }

  @override
  Future selectOption() async {
    return UnimplementedError();
  }
}
