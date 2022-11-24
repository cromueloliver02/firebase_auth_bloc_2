import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './blocs/blocs.dart';
import './pages/pages.dart';
import './utils/utils.dart';

class FirebaseAuthApp extends StatelessWidget {
  FirebaseAuthApp({super.key});

  final _blocsHandler = BlocsHandler();
  final _routesHandler = RoutesHandler();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _blocsHandler.repositoryProviders,
      child: MultiBlocProvider(
        providers: _blocsHandler.blocProviders,
        child: MaterialApp(
          title: 'Firebase Auth App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthPage(),
          routes: _routesHandler.routes,
        ),
      ),
    );
  }
}
