import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../pages/pages.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';

  const HomePage({super.key});

  void _goToProfile(BuildContext ctx) => Navigator.pushNamed(
        ctx,
        ProfilePage.id,
      );

  void _signout(BuildContext ctx) => Navigator.popUntil(
        ctx,
        (route) => route.settings.name == SigninPage.id,
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () => _goToProfile(context),
              iconSize: 30,
              icon: const Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () => _signout(context),
              iconSize: 30,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_xqbchnql.json',
                width: 200,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/bloc_logo_full.png',
                width: 250,
              ),
              const SizedBox(height: 40),
              const Text(
                'Bloc is an awesome\nstate management\nfor Flutter!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
