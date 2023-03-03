import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowButton extends StatelessWidget {
  String buttonText;
  var onPressed;
  RowButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 130,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Text(buttonText)));
  }
}
