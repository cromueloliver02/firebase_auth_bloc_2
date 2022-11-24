import 'package:flutter/material.dart';

import '../blocs/blocs.dart';
import './pages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.unauthenticated) {
          return const SigninPage();
        }

        if (state.status == AuthStatus.authenticated) {
          return const HomePage();
        }

        return const SplashPage();
      },
    );
  }
}
