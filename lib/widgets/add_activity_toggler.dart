import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddActivityToggler extends StatelessWidget {
  Map addActivity;
  Function form;

  AddActivityToggler(
      {super.key, required this.addActivity, required this.form});

  Widget _addActivityToggler() {
    if (addActivity["submit"] == true && addActivity["error"] == false) {
      return Scaffold(
        appBar: AppBar(title: const Text("Add Activity")),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      return form();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _addActivityToggler();
  }
}
