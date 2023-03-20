import 'package:convert_structure_to_json/command/command_method.dart';
import 'package:convert_structure_to_json/command/create/create_default_structure.dart';
import 'package:convert_structure_to_json/common/enums/option_type.dart';
import 'package:convert_structure_to_json/models/option_command/option_command.dart';

class GenerateStructureCommand extends CommandMethod {
  @override
  Future<dynamic> selectOption() async {
    return OptionCommand(optionType: OptionType.generateJson);
  }

  @override
  Future execute(values) async {
    OptionCommand optionCommand = values;
    CommandMethod? commandMethod;
    dynamic result;

    switch (optionCommand.optionType) {
      case OptionType.generateJson:
        commandMethod = CreateStructure();
        result = await commandMethod.selectOption();
        break;
      default:
        break;
    }
    commandMethod!.execute(result);

    return 0;
  }
}
