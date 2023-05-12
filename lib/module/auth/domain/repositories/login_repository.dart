import 'package:fpdart/fpdart.dart';
import '/core/modules/user/domain/entities/user_entity.dart';
import '/module/auth/domain/failures/auth_failure.dart';
import '/module/auth/domain/params/login_param.dart';

abstract class LoginRepository {
  Future<Either<AuthFailure, UserEntity>> login(LoginParam params);
}
