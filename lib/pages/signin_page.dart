import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:validators/validators.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../pages/pages.dart';

class SigninPage extends StatelessWidget {
  static const id = '/signin';

  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const KeyboardDismisser(
        gestures: [
          GestureType.onTap,
          GestureType.onPanUpdateDownDirection,
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: _FormBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormBody extends StatefulWidget {
  const _FormBody({Key? key}) : super(key: key);

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _email, _password;

  void _signin() {
    final FormState? form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    if (kDebugMode) {
      print('_email $_email');
      print('_password $_password');
    }

    Navigator.pushNamed(context, HomePage.id); // TODO: delete temporary code
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!isEmail(value)) return 'Enter a valid email';

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  void _goToSignup() => Navigator.pushReplacementNamed(
        context,
        SignupPage.id,
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: ListView(
        reverse: true,
        shrinkWrap: true,
        children: [
          Image.asset(
            'assets/images/flutter_logo.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 50),
          TextFormField(
            enabled: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            validator: _emailValidator,
            onSaved: (value) => _email = value,
          ),
          const SizedBox(height: 10),
          TextFormField(
            enabled: true,
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
            validator: _passwordValidator,
            onSaved: (value) => _password = value,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _signin,
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('SIGN IN'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _goToSignup,
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('Not a member? Sign up!'),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
