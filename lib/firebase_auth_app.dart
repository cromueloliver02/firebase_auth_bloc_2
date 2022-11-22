import 'package:flutter/material.dart';

import './pages/pages.dart';
import './utils/routes_handler.dart';

class FirebaseAuthApp extends StatelessWidget {
  FirebaseAuthApp({super.key});

  final _routesHandler = RoutesHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.id,
      routes: _routesHandler.routes,
    );
  }
}
