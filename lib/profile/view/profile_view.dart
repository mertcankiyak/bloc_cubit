import 'package:bloc_cubit/profile/viewmodel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile view"),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.profileStatus == ProfileStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Veri başarıyla çekildi')),
              );
            } else if (state.profileStatus == ProfileStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Veri çekilirken bir hata oluştu: ${state.exception.toString()}")),
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                switch (state.profileStatus) {
                  case ProfileStatus.loading:
                    return const CircularProgressIndicator();
                  case ProfileStatus.initial:
                  case ProfileStatus.success:
                    return Column(
                      children: [
                        Text("gelen veri: ${state.list[0]}"),
                        ElevatedButton(
                            onPressed: () {
                              context.read<ProfileCubit>().fetchWeather();
                            },
                            child: Text("state değiş")),
                      ],
                    );
                  case ProfileStatus.failure:
                    return Text("gelen veri: ${state.list[0]}");
                  case ProfileStatus.ifFilterOpen:
                    return const Text("filter open tıklandı");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
