// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/core/modules/theme/presenter/cubits/theme_cubit.dart';
import '../../../../core/modules/user/presenter/cubits/user_cubit.dart';
import '../../../../core/modules/user/presenter/cubits/user_state.dart';

class HomePage extends StatelessWidget {
  final UserCubit userCubit;
  final ThemeCubit themeCubit;

  const HomePage({
    super.key,
    required this.userCubit,
    required this.themeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeCubit, ThemeStyle>(
            bloc: themeCubit,
            builder: (_, state) {
              var icon = Icons.dark_mode;
              if (!themeCubit.isDark) icon = Icons.light_mode;

              return IconButton(
                onPressed: themeCubit.next,
                icon: Icon(icon),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            bloc: userCubit,
            builder: (_, state) {
              if (state is UserAuthenticatedState) {
                return Text(state.user.email);
              }
              return Container();
            },
          ),
          ElevatedButton(
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
              userCubit.logout();
            },
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}
