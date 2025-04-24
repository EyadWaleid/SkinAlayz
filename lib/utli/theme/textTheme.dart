import 'package:flutter/material.dart';

import '../constant/colours.dart';

class TextThemeApp{
  TextThemeApp._();
  static final TextTheme textThemeApp=TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize:60,color: AppColour.primaryColor,fontFamily:'InspirationalDoctor',fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(fontSize:30,color: AppColour.primaryColor,fontFamily:'AstidaScripto',fontWeight: FontWeight.bold),
    titleLarge: const TextStyle().copyWith(color:AppColour.primaryColor,fontSize:30,fontFamily: 'Roboto',fontWeight: FontWeight.bold),
    titleMedium: const TextStyle().copyWith(color: AppColour.primaryColor,fontSize:20,fontFamily: 'Roboto'),
    titleSmall: const TextStyle().copyWith(color: AppColour.primaryColor,fontSize:13,fontFamily: 'Roboto',),
    labelLarge: const TextStyle().copyWith(color: AppColour.primaryColor,fontSize: 16,fontFamily: 'Roboto',fontWeight: FontWeight.bold),
    labelMedium: const TextStyle().copyWith(fontSize: 15,fontFamily: 'Roboto',color:AppColour.primaryColor.withOpacity(0.6)),


  );

}