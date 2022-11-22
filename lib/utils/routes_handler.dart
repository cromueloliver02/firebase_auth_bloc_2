import 'package:flutter/material.dart';

import '../pages/pages.dart';

class RoutesHandler {
  final Map<String, WidgetBuilder> routes = {
    SplashPage.id: (ctx) => const SplashPage(),
    SigninPage.id: (ctx) => const SigninPage(),
  };
}
