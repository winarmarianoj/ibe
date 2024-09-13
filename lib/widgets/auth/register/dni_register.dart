// widgets/auth/register/dni_register.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/register_form_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';

class DniRegister extends StatelessWidget {
  const DniRegister({
    super.key,
    required this.registerForm,
  });

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.number,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintIdentificationRegister,
          labelText: textLabelIdentificationRegister,
          prefixIcon: Icons.document_scanner),
      onChanged: (value) => registerForm.dni = value,
      validator: (value) {
        String pattern = textRegexPatternByPhoneNumber;
        RegExp regExp = RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 8)
            ? null
            : textDniInvalidDataFormat;
      },
    );
  }
}
