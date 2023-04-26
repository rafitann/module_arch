import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_state.dart';

import '../../modules/user/presenter/cubits/user_cubit.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final userCubit = Modular.get<UserCubit>();

    print('AUTH-GUARD');

    if (userCubit.state is UserUnauthenticatedState) {
      return false;
    }
    return true;
  }
}
