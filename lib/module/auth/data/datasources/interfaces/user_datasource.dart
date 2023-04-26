import 'package:modulearch/core/modules/user/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUserByID(String id);
}
