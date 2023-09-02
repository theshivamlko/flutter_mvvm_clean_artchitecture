import 'dart:ui';

import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/fonts_manager.dart';

class StyleManager {
 static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

 static TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontsManager.fontFamily,
      FontWeightManager.normal,
      color,
    );
  }
 static TextStyle getHeadlineStyle(
      {double fontSize = FontSize.s25, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontsManager.fontFamily,
      FontWeightManager.semiBold,
      color,
    );
  }
}