import 'dart:ui';

class FontsManager {
  static const String fontFamily = "SpicyPotatos";
}

class FontWeightManager {
  static const FontWeight normal = FontWeight.normal;
  static const FontWeight semiBold = FontWeight.w600;
}

class FontSize{
  static const double s12 = 12.0;
  static const double s18 = 18.0;
  static const double s25 = 25.0;

}


extension HexColor on Color {
  static Color toHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 6));
  }
}
