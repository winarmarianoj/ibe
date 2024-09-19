// widgets/ui/inputDecorations.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';


class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: themeInputDecorationLogin),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: themeInputDecorationLogin, width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: themeInputDecorationLoginLabel),
        labelText: labelText,
        labelStyle: const TextStyle(color: themeInputDecorationLoginLabel),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: themeInputDecorationLogin,
              )
            : null,
    );        
  }
}