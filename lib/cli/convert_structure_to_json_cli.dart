import 'dart:io';

import 'package:args/args.dart';
import 'package:convert_structure_to_json/command/command_method.dart';
import 'package:convert_structure_to_json/command/create/generate_structure_command.dart';
import 'package:convert_structure_to_json/constant/app_constant.dart';

class ConvertStructureToJsonCLI {
  late ArgParser _argParser;

  ConvertStructureToJsonCLI._(this._argParser);

  factory ConvertStructureToJsonCLI() {
    final argParser = ArgParser();

    return ConvertStructureToJsonCLI._(argParser);
  }

  void run(List<String> arguments) {
    _addCommand();
    _handleArgument(arguments);
  }

  void _addCommand() {
    _argParser.addCommand(AppConstant.create);
    _argParser.addCommand(AppConstant.help);
  }

  void _handleArgument(List<String> arguments) {
    final arg = _argParser.parse(arguments);

    if (arg.command != null && arg.command?.name != null) {
      _listenArgument(arg.command!.name!);
    } else {
      stdout.writeln('Command not found!');

      _exit();
    }
  }

  void _listenArgument(String argument) async {
    CommandMethod? commandMethod;
    dynamic result;
    switch (argument) {
      case AppConstant.create:
        commandMethod = GenerateStructureCommand();
        result = await commandMethod.selectOption();
        break;
      default:
        _exit();
    }
    commandMethod!.execute(result);
  }

  void _exit() {
    stderr.writeln('Command not found!');
    // stderr.writeln('Run with -h option to get help');
    exit(1);
  }
}
