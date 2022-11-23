import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit({
    required this.authRepository,
  }) : super(SignupState.initial());

  void signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: SignupStatus.submitting));

    try {
      await authRepository.signup(
        name: name,
        email: email,
        password: password,
      );

      emit(state.copyWith(status: SignupStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: SignupStatus.error,
        error: err,
      ));

      if (kDebugMode) print('state $state');
    }
  }
}
