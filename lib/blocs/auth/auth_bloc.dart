import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initial()) {
    authSubscription = authRepository.user.listen((fb_auth.User? user) {
      add(UserStateChangedEvent(user: user));
    });

    on<UserStateChangedEvent>(_userStateChanged);
    on<SignoutRequestedEvent>(_signoutRequested);
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }

  void _userStateChanged(
    UserStateChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final fb_auth.User? user = event.user;

    if (user == null) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      ));
    }

    if (user != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      ));
    }
  }

  void _signoutRequested(
    SignoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.signout();
  }
}
