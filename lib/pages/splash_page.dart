import 'package:flutter/material.dart';

import '../pages/pages.dart';

class SplashPage extends StatefulWidget {
  static const id = '/splash';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _goToNextPage();
  }

  void _goToNextPage() async {
    final navigator = Navigator.of(context);

    await Future.delayed(const Duration(seconds: 1));

    navigator.pushNamed(SigninPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter_logo.png'),
            const SizedBox(height: 50),
            const SizedBox(
              height: 75,
              width: 75,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 50),
            const Text(
              'LOADING ...',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
