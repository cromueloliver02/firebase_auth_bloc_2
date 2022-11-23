part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final User user;
  final ProfileStatus status;
  final CustomError error;

  const ProfileState({
    required this.user,
    required this.status,
    required this.error,
  });

  factory ProfileState.initial() {
    return ProfileState(
      user: User.initial(),
      status: ProfileStatus.initial,
      error: const CustomError(),
    );
  }

  @override
  List<Object> get props => [user, status, error];

  @override
  String toString() =>
      'ProfileState(user: $user, status: $status, error: $error)';

  ProfileState copyWith({
    User? user,
    ProfileStatus? status,
    CustomError? error,
  }) {
    return ProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}
