// providers/theme_change_provider.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/theme/menuTheme.dart';

class ThemeChanger with ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  bool _darkTheme   = false;
  bool _customTheme = false;
  
  ThemeData? _currentTheme;

  bool get darkTheme   => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme!;
  
  ThemeChanger( int theme ) {

    switch( theme ) {

      case 1: // light
        _darkTheme   = false;
        _customTheme = true;
        _currentTheme = themeLightTwo; // ThemeData.light(); //themeLightTwo;  
      break;

      case 2: // Dark
        _darkTheme   = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(      
          colorScheme: ColorScheme?.fromSwatch().copyWith(
            //brightness: Brightness.light,
            secondary: Colors.pink,
          ),
        );
      break;

      case 3: // Dark
        _darkTheme   = false;
        _customTheme = true;
      break; 

      default:
        _darkTheme = false;        
        _currentTheme = themeDarkTwo; // ThemeData.dark(); // themeDarkTwo;
    }
  }

  set darkTheme( bool value ) {
    _customTheme = false;
    _darkTheme = value;
    if ( value ) {
     _currentTheme = ThemeData.dark().copyWith(      
          colorScheme: ColorScheme?.fromSwatch().copyWith(
            //brightness: Brightness.light,
            secondary: Colors.pink,
          ),
        ); 
    } else {
      _currentTheme = themeLightTwo; // ThemeData.light(); // themeLightTwo; 
    }

    notifyListeners();
  }

  set customTheme( bool value ) {
    _customTheme = value;
    _darkTheme = false;

    if ( value ) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme?.fromSwatch().copyWith(
            //brightness: Brightness.light,
            secondary: const Color.fromARGB(255, 4, 97, 179),
          ),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202B),
          textTheme: const TextTheme(
            bodyMedium: TextStyle( color: Colors.white )
          ),
          // textTheme.body1.color
      ); 
    } else {
      _currentTheme = themeDarkTwo; // ThemeData.dark(); // themeDarkTwo; 
    }

    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print(_currentTheme);

    return formKey.currentState?.validate() ?? false;
  }

}