// widgets/auth/login/email_login_widget.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/user_provider.dart';
import 'package:ibe_assistance/widgets/ui/inputDecorations.dart';

class EmailLoginWidget extends StatelessWidget {
  const EmailLoginWidget({
    super.key,
    required this.userFormProvider,
  });

  final UserFormProvider userFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          hintText: textYouEmail,
          labelText: textLabelTitleEmail,
          prefixIcon: Icons.alternate_email_rounded
      ),
      onChanged: (value) => userFormProvider.email = value,
      validator: (value) {
        String pattern = textRegexPatternEmail;
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : textInvalidData;
      },
    );
  }
}