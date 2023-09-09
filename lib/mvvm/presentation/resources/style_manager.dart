
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/fonts_manager.dart';

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
      {double fontSize = FontSize.s40, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontsManager.fontFamily,
      FontWeightManager.semiBold,
      color,
    );
  }
}
