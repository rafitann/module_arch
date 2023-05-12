import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/core/modules/user/presenter/cubits/user_state.dart';

import '../../modules/user/presenter/cubits/user_cubit.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final userCubit = Modular.get<UserCubit>();

    debugPrint('AUTH-GUARD');

    if (userCubit.state is UserUnauthenticatedState) {
      return false;
    }
    return true;
  }
}
