// theme/menuTheme.dart

import 'package:flutter/material.dart';


 Brightness estimateBrightnessForColor(Color color) {
    final double relativeLuminance = color.computeLuminance();

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const double kThreshold = 0.15;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
 
ThemeData themeLightTwo = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.deepOrangeAccent,
    backgroundColor: Colors.deepPurpleAccent,
//    focusColor: Colors.amber,
//    hoverColor: Colors.black,
//    splashColor: Colors.brown,
  ),
  brightness: Brightness.light,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: const MaterialColor(
    /* 0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1aF5E0C3),
      100: Color(0xa1F5E0C3),
      200: Color(0xaaF5E0C3),
      300: Color(0xafF5E0C3),
      400: Color(0xffF5E0C3),
      500: Color(0xffEDD5B3),
      600: Color(0xffDEC29B),
      700: Color(0xffC9A87C),
      800: Color(0xffB28E5E),
      900: Color(0xff936F3E) */
      0xFF1CE9D4,
    <int, Color>{
      50: Color(0x1a1CE9D4),
      100: Color(0xa11CE9D4),
      200: Color(0xaa1CE9D4),
      300: Color(0xaf1CE9D4),
      400: Color(0xff1CE9D4),
      500: Color(0xff1CE9D4),
      600: Color(0xff1CE9D4),
      700: Color(0xff1CE9D4),
      800: Color(0xff1CE9D4),
      900: Color(0xff1CE9D4)
    },
  ),
  primaryColor: const Color(0xff1CE9D4),
  
  primaryColorLight: const Color(0x1aF5E0C3),
  primaryColorDark: const Color(0xff1CE9D4),
  canvasColor: const Color(0xffE09E45),
  colorScheme: const ColorScheme.highContrastLight(brightness : Brightness.light, 
  primary : Color(0xff457BE0), onPrimary : Color.fromARGB(255, 97, 143, 228)),
  hintColor: const Color(0xff457BE0),
  //accentColorBrightness : ThemeData.estimateBrightnessForColor(Brightness.lighty),
  // color fondo background
  scaffoldBackgroundColor: const Color.fromARGB(170, 27, 207, 189),
  
  cardColor: const Color(0xaa1CE9D4),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1aF5E0C3),
  hoverColor: const Color(0xff1CE9D4),
  highlightColor: const Color(0xff1CE9D4),
  splashColor: const Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: const ButtonThemeData(
      //button themes
      ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
      //toggle button theme
      ),
  //buttonColor: Color(0xff1CE9D4),
  secondaryHeaderColor: Colors.grey,
  /* textSelectionColor: Color(0xffB5BFD3),
  cursorColor: Color(0xff936F3E),
  textSelectionHandleColor: Color(0xff936F3E), */
  
  dialogBackgroundColor: Colors.white,
  indicatorColor: const Color(0xff457BE0),
  
  textTheme: const TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: const TextTheme(
      //text theme that contrast with primary color
      ),
  //accentTextTheme: themeDarkTwo.textTheme.headlineLarge(color: themeDarkTwo.colorScheme.onSecondary,),
  inputDecorationTheme: const InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: const IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: const IconThemeData(
      //icon themes that contrast primary color
      ),
  //accentIconTheme: IconThemeData(//icon themes that contrast accent color),
);

ThemeData themeDarkTwo = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
  foregroundColor: Colors.blueAccent,
  backgroundColor: Colors.deepOrangeAccent
//  focusColor: Colors.amber,
//  hoverColor: Colors.black,
//  splashColor: Colors.brown,
  ),
  brightness: Brightness.dark,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: const MaterialColor(
    /* 0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06) */
      0xFF0E655C,
    <int, Color>{
      50: Color(0x1a0E655C),
      100: Color(0xa10E655C),
      200: Color(0xaa0E655C),
      300: Color(0xaf0E655C),
      400: Color(0x1a0E655C),
      500: Color(0xa10E655C),
      600: Color(0xaa0E655C),
      700: Color(0xff0E655C),
      800: Color(0xaf0E655C),
      900: Color(0xff0E655C)      
    },
  ),
  primaryColor: const Color(0xff0E655C),
  
  primaryColorLight: const Color(0x1a311F06),
  primaryColorDark: const Color(0xff0E655C),
  canvasColor: const Color(0xffE09E45),
  //colorScheme: themeLightTwo.colorScheme.copyWith(secondary: Colors.pink),
  colorScheme: const ColorScheme.highContrastDark(brightness : Brightness.dark, 
  primary : Color.fromARGB(255, 202, 76, 18), onPrimary : Color.fromARGB(255, 175, 26, 7)),
  hintColor: const Color(0xff457BE0),
  //accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xaa0E655C),// Color.fromARGB(255, 10, 76, 206),
  
  cardColor: const Color.fromARGB(170, 35, 143, 132),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color.fromARGB(26, 71, 45, 8),
  hoverColor: const Color.fromARGB(160, 59, 180, 168),
  highlightColor: const Color.fromARGB(174, 75, 47, 9),
  splashColor: const Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: const ButtonThemeData(
//button themes
      ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
//toggle button theme
      ),
  //buttonColor: Color(0xffC24303),
  secondaryHeaderColor: Colors.grey,
  /* textSelectionColor: Color(0x1a483112),
  cursorColor: Color(0xff483112),
  textSelectionHandleColor: Color(0xff483112), */
     
  dialogBackgroundColor: const Color.fromARGB(255, 187, 30, 30),
  indicatorColor: const Color.fromARGB(255, 159, 168, 185),
    textTheme: const TextTheme(
//text themes that contrast with card and canvas
      ),
  primaryTextTheme: const TextTheme(
//text theme that contrast with primary color
      ),
 // accentTextTheme: TextTheme(//text theme that contrast with accent Color),
  inputDecorationTheme: const InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: const IconThemeData(
//icon themes that contrast with card and canvas
      ),
  primaryIconTheme: const IconThemeData(
//icon themes that contrast primary color
      ),
  //accentIconTheme: IconThemeData(//icon themes that contrast accent color),
);
