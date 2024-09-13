// widgets/auth/register/email_register.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';

class EmailRegister extends StatelessWidget {
  const EmailRegister({
    super.key,
    required this.registerForm,
  });

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          hintText: textYouEmail,
          labelText: textLabelTitleEmail,
          prefixIcon: Icons.alternate_email_rounded),
      onChanged: (value) => registerForm.email = value,
      validator: (value) {
        String pattern = textRegexPatternEmail;                    
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : textInvalidData; },
    );
  }
}