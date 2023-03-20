import 'package:convert_structure_to_json/common/enums/option_type.dart';
import 'package:convert_structure_to_json/models/option_command/option_command.dart';
import 'package:convert_structure_to_json/text/text_log.dart';

class CreateStructureRepo {
  Future<List<OptionCommand>> getListOptions() async {
    List<OptionCommand> list = [];
    list.add(OptionCommand(
        title: '🪛${TextLog.log(
      colorName: ColorName.green,
      text: 'Select option to generate Project structure:',
    )}'));
    list.add(OptionCommand(
        title: TextLog.log(
          colorName: ColorName.blue,
          text: '1. Default structure',
        ),
        id: '1',
        optionType: OptionType.generateJson));
    list.add(OptionCommand(
        title: TextLog.log(
      colorName: ColorName.green,
      text: 'Select 1 option to continue:',
    )));
    return list;
  }
}
