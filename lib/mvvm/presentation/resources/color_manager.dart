import 'dart:ui';

class ColorManager {
  static Color primary = const Color(0xFFED9728);
  static Color darkGrey = const Color(0xFF414141);
  static Color grey = const Color(0xFF6B6B6B);
  static Color background = const Color(0xFFDCDCDC);
  static Color lightGrey = HexColor.toHex("#A7A7A7");
}

extension HexColor on Color {
  static Color toHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
