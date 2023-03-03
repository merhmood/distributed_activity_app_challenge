import 'package:distributed_challenge/utilities/activity_provider.dart';
import 'package:distributed_challenge/utilities/get_texts.dart';
import 'package:distributed_challenge/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

//This activity page handles dynamic parameters
// ignore_for_file: must_be_immutable
class ActivityPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var id;
  ActivityPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    List<Map> items = context.watch<ActivityProvider>().activities;
    var texts = getTexts(items, id);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 78, left: 8, right: 8, bottom: 8),
              child: Container(
                height: 350,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(196, 194, 194, 0.05),
                          blurRadius: 15)
                    ]),
                child: Padding(
                    padding: const EdgeInsets.only(top: 65),

                    //renders a box with texts
                    child: ListView.builder(
                        itemCount: texts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Text(
                              texts[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RowButton(
                      buttonText: 'Edit',
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text('Update Done!'),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }),
                  RowButton(
                      buttonText: 'Delete',
                      onPressed: () {
                        context.go('/');
                        var activities = [
                          ...Provider.of<ActivityProvider>(context,
                                  listen: false)
                              .activities
                        ];
                        Provider.of<ActivityProvider>(context, listen: false)
                            .setActivities([...activities], id);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
