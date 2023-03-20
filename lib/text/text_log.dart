class TextLog {
  static String log(
          {required String text, ColorName colorName = ColorName.black}) =>
      '\x1B[${textCodeToString(colorName)}m$text\x1B[0m';

  static String textCodeToString(ColorName colorName) {
    return colorCode[colorName.name] ?? colorCode[ColorName.black];
  }
}

enum ColorName { black, red, yellow, green, blue }

Map<String, dynamic> colorCode = {
  ColorName.black.name: '30',
  ColorName.red.name: '31',
  ColorName.green.name: '32',
  ColorName.yellow.name: '33',
  ColorName.blue.name: '34',
};
