import '/core/modules/user/domain/entities/user_entity.dart';
import '/module/auth/domain/failures/auth_failure.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginErrorState extends LoginState {
  const LoginErrorState(this.failure);
  final AuthFailure failure;
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState(this.user);
  final UserEntity user;
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}
