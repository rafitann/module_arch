import 'package:fpdart/fpdart.dart';
import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';

abstract class LoginRepository {
  Future<Either<AuthFailure, UserEntity>> login(LoginParam params);
}
