// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/theme/presenter/cubits/theme_cubit.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_cubit.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_state.dart';

class HomePage extends StatelessWidget {
  final UserCubit userCubit;
  final ThemeCubit themeCubit;

  const HomePage({
    Key? key,
    required this.userCubit,
    required this.themeCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: themeCubit.next,
            icon: const Icon(Icons.dark_mode),
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
