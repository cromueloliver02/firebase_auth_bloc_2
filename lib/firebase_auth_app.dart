import 'package:flutter/material.dart';

import './pages/pages.dart';

class FirebaseAuthApp extends StatelessWidget {
  const FirebaseAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
