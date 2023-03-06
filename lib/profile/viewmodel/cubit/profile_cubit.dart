import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState()) {
    fetchData();
  }

  //YÖNTEM1
  // Future<void> fetchData() async {
  //   emit(const ProfileState(profileStatus: ProfileStatus.loading));
  //   try {
  //     await Future.delayed(const Duration(seconds: 2));
  //     print("veri geldi");
  //     emit(const ProfileState(profileStatus: ProfileStatus.success));
  //   } on Exception catch (exception) {
  //     emit(ProfileState(profileStatus: ProfileStatus.failure, exception: exception));
  //   }
  //   emit(const ProfileState(profileStatus: ProfileStatus.loading));
  // }

  //YÖNTEM2
  Future<void> fetchData() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      print("veri geldi");
      emit(state.copyWith(profileStatus: ProfileStatus.success, list: ["ankara", "izmir", "adıyaman", "istanbul"]));
    } on Exception catch (exception) {
      emit(state.copyWith(profileStatus: ProfileStatus.failure, exception: exception));
    }
  }

  Future<void> fetchWeather() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      print("hava durumu geldi");
      emit(state.copyWith(profileStatus: ProfileStatus.success));
    } on Exception catch (exception) {
      emit(state.copyWith(profileStatus: ProfileStatus.failure, exception: exception));
    }
  }
}
