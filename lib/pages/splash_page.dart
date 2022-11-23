import 'package:flutter/material.dart';

import '../blocs/blocs.dart';
import '../pages/pages.dart';

class SplashPage extends StatelessWidget {
  static const id = '/splash';

  const SplashPage({super.key});

  void _authListener(BuildContext ctx, AuthState state) {
    if (state.status == AuthStatus.unauthenticated) {
      Navigator.pushNamed(ctx, SigninPage.id);
    }

    if (state.status == AuthStatus.authenticated) {
      Navigator.pushNamed(ctx, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: _authListener,
        child: Center(
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
      ),
    );
  }
}
