// widgets/auth/register/phone_register.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';

class PhoneNumberRegister extends StatelessWidget {
  const PhoneNumberRegister({
    super.key,
    required this.registerForm,
  });

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintTextPhoneRegister,
          labelText: textLabelPhoneRegister,
          prefixIcon: Icons.phone),
      onChanged: (value) => registerForm.phone = value,
      validator: (value) {
        String pattern = textRegexPatternByPhoneNumber;
        RegExp regExp = RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 15)
            ? null
            : textPhoneInvalidDataFormat;
      },
    );
  }
}
