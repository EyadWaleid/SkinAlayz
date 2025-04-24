import 'package:flutter/material.dart';
import 'package:skinalayz/utli/constant/colours.dart';
import 'package:skinalayz/utli/theme/textTheme.dart';

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    textTheme:TextThemeApp.textThemeApp,
    scaffoldBackgroundColor: AppColour.scaffoldColour

  );
}
