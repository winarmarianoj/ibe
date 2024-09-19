// providers/person_user_provider.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/models/person_user.dart';

class PersonUserProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  PersonUser personUser = PersonUser(name: "", lastName: "", email: "", dni: "", role: "", grade: "", token: "");

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$personUser');

    return formKey.currentState?.validate() ?? false;
  }
}