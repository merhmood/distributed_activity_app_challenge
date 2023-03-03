import 'package:flutter/material.dart';

class AddActivityProvider with ChangeNotifier {
  Map _formValue = {
    'accessiblity': '',
    'type': '',
    'participants': '',
    'price': ''
  };

  Map get formValue => _formValue;
  setFormValue(Map formValue) {
    _formValue = {..._formValue, ...formValue};
    notifyListeners();
  }
}
