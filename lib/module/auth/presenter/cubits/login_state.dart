import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginErrorState extends LoginState {
  final AuthFailure failure;
  const LoginErrorState(this.failure);
}

class LoginSuccessState extends LoginState {
  final UserEntity user;
  const LoginSuccessState(this.user);
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}
