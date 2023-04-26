import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_cubit.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_state.dart';

class HomePage extends StatelessWidget {
  final UserCubit userCubit;

  const HomePage({
    Key? key,
    required this.userCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            bloc: userCubit,
            builder: (_, state) {
              final user = (state as UserAuthenticatedState).user;

              return Text(user.email);
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
