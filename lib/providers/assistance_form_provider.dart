// providers/assistance_form_provider.dart

import 'package:flutter/material.dart';

class AssistanceFormProvider extends ChangeNotifier {
    GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String dateFrom = '';
  String dateTo = '';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$dateFrom - $dateTo');

    return formKey.currentState?.validate() ?? false;
  }  
}