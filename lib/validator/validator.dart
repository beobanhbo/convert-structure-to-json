class Validator {
  static final dartOrJsonFile = RegExp(r'\.(dart|json)$');
  static final invalidFileExtension = RegExp(r'^\.|\.(yaml|iml|md|lock)$');
  static final invalidFolderName = RegExp(r'^(android|ios|test|build)$');

  static bool isInvalidFileExtension(String str) {
    return validatorByRegex(regExp: invalidFileExtension, data: str);
  }

  static bool isInvalidFolderName(String str) {
    return validatorByRegex(regExp: invalidFolderName, data: str);
  }

  static bool isDartOrJsonFile(String fileName) {
    return validatorByRegex(regExp: dartOrJsonFile, data: fileName);
  }

  static bool validatorByRegex(
      {required RegExp regExp, required String? data}) {
    if (data == null || data.trim().isEmpty) return false;
    return regExp.hasMatch(data);
  }
}
