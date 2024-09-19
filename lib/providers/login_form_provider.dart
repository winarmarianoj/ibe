// providers/login_form_provider.dart
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String email = '';
  String dni = '';
  String dnitwo = '';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());
    
    print('$email - $dni - $dnitwo');

    return formKey.currentState?.validate() ?? false;
  }
}
