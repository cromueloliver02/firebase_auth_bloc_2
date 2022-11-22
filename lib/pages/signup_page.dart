import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:validators/validators.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../pages/pages.dart';

class SignupPage extends StatelessWidget {
  static const id = '/signup';

  const SignupPage({super.key});

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
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _name, _email, _password;

  void _signin() {
    final FormState? form = _formKey.currentState;

    setState(() => _autovalidateMode = AutovalidateMode.always);

    if (form == null || !form.validate()) return;

    form.save();

    if (kDebugMode) {
      print('_name $_name');
      print('_email $_email');
      print('_password $_password');
    }

    Navigator.pushNamed(context, HomePage.id); // TODO: delete temporary code
  }

  String? _nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 6) {
      return 'Name must be at least 6 characters long';
    }

    return null;
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

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm password is required';
    }

    if (_passwordController.text.trim() != value.trim()) {
      return 'Passwords does not match';
    }

    return null;
  }

  void _goToSignin() => Navigator.pushReplacementNamed(
        context,
        SigninPage.id,
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
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name',
              prefixIcon: Icon(Icons.account_circle),
              border: OutlineInputBorder(),
            ),
            validator: _nameValidator,
            onSaved: (value) => _name = value,
          ),
          const SizedBox(height: 10),
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
            controller: _passwordController,
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
          TextFormField(
            enabled: true,
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
            validator: _confirmPasswordValidator,
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
            child: const Text('SIGN UP'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _goToSignin,
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: const Text('Member already? Sign in!'),
          ),
        ].reversed.toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
