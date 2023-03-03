import 'dart:convert' as convert;

import 'package:distributed_challenge/utilities/activity_provider.dart';
import 'package:distributed_challenge/utilities/add_activity_provider.dart';
import 'package:distributed_challenge/utilities/error_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:distributed_challenge/widgets/text_form_field_with_padding_bottom.dart';
import 'package:distributed_challenge/utilities/fetch_data.dart';

import 'package:distributed_challenge/widgets/add_activity_toggler.dart';
import 'package:provider/provider.dart';

// this page handles creating new item
class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  var addActivity = {'submit': false, 'error': false};
  // ignore: prefer_typing_uninitialized_variables
  var formValue;

  // ignore: prefer_typing_uninitialized_variables
  var data;

  fetchDataLogic(res, error) {
    var body;
    try {
      body = convert.jsonDecode(res.body);
    } on NoSuchMethodError {
      body = {"error": "had some errors"};
    }
    if (body["error"] != null || error) {
      setState(() {
        addActivity = {...addActivity, 'error': true};
        context.read<AddActivityProvider>().setFormValue(
            {'accessiblity': '', 'type': '', 'participants': '', 'price': ''});
      });
    } else {
      // ignore: use_build_context_synchronously
      context.read<ActivityProvider>().setActivity({...body});
      // ignore: use_build_context_synchronously
      context.go('/');
    }
  }

  getData() {
    if (formValue['type'].isEmpty ||
        formValue['accessiblity'].isEmpty ||
        formValue['participants'].isEmpty ||
        formValue['price'].isEmpty) {
      addActivity = {...addActivity, "error": true};
    } else {
      fetchData(
          'http://www.boredapi.com/api/activity?type=${formValue['type']}&accessiblity=${formValue['accessiblity']}&participants=${formValue['participants']}&price=${formValue['price']}',
          fetchDataLogic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AddActivityToggler(
      addActivity: {...addActivity},
      form: form,
    );
  }

  Widget form() {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Activity")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Form(
          child: Column(
            children: <Widget>[
              errorMessage(addActivity['error']),
              TextFormFieldWithPaddingBottom(labelText: 'accessiblity'),
              TextFormFieldWithPaddingBottom(labelText: 'type'),
              TextFormFieldWithPaddingBottom(
                labelText: 'participants',
              ),
              TextFormFieldWithPaddingBottom(labelText: 'price'),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    formValue =
                        Provider.of<AddActivityProvider>(context, listen: false)
                            .formValue;
                    setState(() {
                      addActivity = {"submit": true, "error": false};
                    });
                    getData();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
