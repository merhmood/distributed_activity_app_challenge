import 'package:distributed_challenge/utilities/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:distributed_challenge/screens/activity_screen.dart';
import 'package:distributed_challenge/screens/add_activity_screen.dart';
import 'package:distributed_challenge/screens/home_screen.dart';
import 'package:distributed_challenge/utilities/add_activity_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AddActivityProvider()),
      ChangeNotifierProvider(create: (_) => ActivityProvider())
    ],
    child: const MyApp(),
  ));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
    GoRoute(
      path: '/Activity/new',
      builder: (BuildContext context, GoRouterState state) {
        return const AddActivityPage();
      },
    ),
    GoRoute(
      path: '/Activity/:id',
      builder: (BuildContext context, GoRouterState state) {
        return ActivityPage(id: state.params['id']);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
