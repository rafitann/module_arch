import 'package:fpdart/fpdart.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';
import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/repositories/login_repository.dart';

import '../datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  const LoginRepositoryImpl(this._datasource);

  @override
  Future<Either<AuthFailure, UserEntity>> login(LoginParam params) async {
    try {
      final response = await _datasource.login(params);
      return Right(response);
    } on AuthFailure catch (error) {
      return Left(error);
    }
  }
}
