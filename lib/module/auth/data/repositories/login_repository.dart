import 'package:fpdart/fpdart.dart';
import '/core/modules/user/domain/entities/user_entity.dart';
import '/module/auth/domain/failures/auth_failure.dart';
import '/module/auth/domain/params/login_param.dart';
import '/module/auth/domain/repositories/login_repository.dart';

import '../datasources/datasources.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl(this._datasource, this._userDatasource);
  final LoginDatasource _datasource;
  final UserDatasource _userDatasource;

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
