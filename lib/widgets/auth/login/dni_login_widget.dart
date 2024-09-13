// widgets/auth/login/dni_login_widget.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/login_form_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';


class DniLoginWidget extends StatelessWidget {
  const DniLoginWidget({
    super.key,
    required this.loginForm,
  });

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.authInputDecoration(
          hintText: textYouDni,
          labelText: textLabelTitleDni,
          prefixIcon: Icons.document_scanner
      ),
      onChanged: (value) => loginForm.dni = value,
      validator: (value) {
        String pattern = textRegexPatternByDni;
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : textInvalidDni;
      },
    );
  }
}