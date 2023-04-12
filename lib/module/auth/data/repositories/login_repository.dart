import 'package:fpdart/fpdart.dart';
import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';
import 'package:modulearch/module/auth/domain/repositories/login_repository.dart';

import '../datasources/datasources.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;
  final UserDatasource _userDatasource;

  const LoginRepositoryImpl(this._datasource, this._userDatasource);

  @override
  Future<Either<AuthFailure, UserEntity>> login(LoginParam params) async {
    try {
      final userID = await _datasource.login(params);
      final user = await _userDatasource.getUserByID(userID);

      return Right(user);
    } on AuthFailure catch (error) {
      return Left(error);
    }
  }
}
