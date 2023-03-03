import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:distributed_challenge/utilities/add_activity_provider.dart';

// ignore: must_be_immutable
class TextFormFieldWithPaddingBottom extends StatefulWidget {
  String labelText;

  TextFormFieldWithPaddingBottom({super.key, required this.labelText});

  @override
  State<TextFormFieldWithPaddingBottom> createState() =>
      _TextFormFieldWithPaddingBottomState();
}

class _TextFormFieldWithPaddingBottomState
    extends State<TextFormFieldWithPaddingBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onChanged: (String value) {
          context
              .read<AddActivityProvider>()
              .setFormValue({widget.labelText: value});
        },
        decoration: InputDecoration(
            label: Text(widget.labelText),
            border: const OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.solid))),
      ),
    );
    ;
  }
}
