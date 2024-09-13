// providers/register_form_provider.dart
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String name = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String dni = '';  
  String role = '';
  String grade = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$name - $lastName - $phone - $email - $dni - $role - $grade');

    return formKey.currentState?.validate() ?? false;
  }
}
