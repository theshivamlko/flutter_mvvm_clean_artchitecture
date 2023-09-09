

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/value_manager.dart';

class ThemeManager{

 static ThemeData getAppTheme(){
    return ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightGrey,
      disabledColor:  ColorManager.lightGrey,
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: AppSize.s4
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
         backgroundColor: Colors.deepOrange
      ),
      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        buttonColor: Colors.purple
      )
    );
  }
}

