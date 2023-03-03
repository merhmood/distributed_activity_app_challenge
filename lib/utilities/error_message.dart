import 'package:flutter/material.dart';

Widget errorMessage(state) {
  return state == true
      ? const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text('An Error occured, try again'),
        )
      : const Text('');
}
