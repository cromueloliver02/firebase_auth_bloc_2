import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({
    required this.profileRepository,
  }) : super(ProfileState.initial());

  void fetchProfile(String uid) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      final User user = await profileRepository.fetchProfile(uid);

      if (kDebugMode) print('user $user');

      emit(state.copyWith(
        status: ProfileStatus.loaded,
        user: user,
      ));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: ProfileStatus.error,
        error: err,
      ));

      if (kDebugMode) print('state $state');
    }
  }
}
