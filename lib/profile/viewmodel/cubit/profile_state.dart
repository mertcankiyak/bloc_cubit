part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure, ifFilterOpen }

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final List<String> list;
  final Exception? exception;
  const ProfileState({this.profileStatus = ProfileStatus.initial, this.list = const [], this.exception});

  @override
  List<Object?> get props => [profileStatus, list, exception];

  ProfileState copyWith({ProfileStatus? profileStatus, List<String>? list, Exception? exception}) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      list: list ?? this.list,
      exception:  exception ?? this.exception,
    );
  }
}
