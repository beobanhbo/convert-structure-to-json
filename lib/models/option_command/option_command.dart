import 'package:convert_structure_to_json/common/enums/option_type.dart';

class OptionCommand {
  String? title, id;
  OptionType optionType;
  OptionCommand({this.title, this.id = '', this.optionType = OptionType.none});
}
