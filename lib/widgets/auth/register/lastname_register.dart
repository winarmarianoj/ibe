// widgets/auth/register/lastname_register.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';

class LastnameRegister extends StatelessWidget {
  const LastnameRegister({
    super.key,
    required this.registerForm,
  });

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintTextLastNameRegister,
          labelText: textLabelLastNameRegister,
          prefixIcon: Icons.title),
      onChanged: (value) => registerForm.lastName = value,
      validator: (value) {
        String pattern = textRegexPatternByString;
        RegExp regExp = RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 80)
            ? null
            : textInvalidDataFormat;
      },
    );
  }
}