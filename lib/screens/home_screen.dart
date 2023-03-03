import 'package:distributed_challenge/utilities/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var items = context.watch<ActivityProvider>().activities;
    if (items != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Activities"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final itemName = items[index]['activity'];
              final itemType = items[index]['type'];
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Card(
                    child: ListTile(
                  title: Text(itemName, style: const TextStyle(fontSize: 15.8)),
                  subtitle: Text(
                    itemType,
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    context.go("/Activity/$index");
                  },
                )),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/Activity/new');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Activities"),
        ),
        body: const Text(''),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/Activity/new');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      );
    }
  }
}
