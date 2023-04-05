import 'package:fpdart/fpdart.dart';
import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';

import '../repositories/login_repository.dart';

abstract class LoginUseCase {
  Future<Either<AuthFailure, UserEntity>> call(LoginParam param);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;

  const LoginUseCaseImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(LoginParam param) async {
    if (param.password.length < 8) {
      return Left(ValidationAuthFailure(
        message: 'A senha deve conter ao menos 8 caracteres.',
        stackTrace: StackTrace.current,
      ));
    }

    final RegExp regexEmail =
        RegExp(r'/^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$/i');

    if (!regexEmail.hasMatch(param.email)) {
      return Left(
        ValidationAuthFailure(
          message: 'E-mail não é válido.',
          stackTrace: StackTrace.current,
        ),
      );
    }
    return _loginRepository.login(param);
  }
}
