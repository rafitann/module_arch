import 'package:fpdart/fpdart.dart';
import 'package:modulearch/module/auth/domain/entities/user_entity.dart';
import 'package:modulearch/module/auth/domain/failures/auth_failure.dart';

abstract class LoginUseCase {
  Future<Either<AuthFailure, UserEntity>> call();
}
