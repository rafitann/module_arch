import 'package:modulearch/module/auth/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUserByID(String id);
}
