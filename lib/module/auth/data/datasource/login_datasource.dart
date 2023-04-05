import 'package:modulearch/module/auth/domain/entities/user_entity.dart';

import '../../domain/params/login_param.dart';

abstract class LoginDatasource {
  Future<UserEntity> login(LoginParam param);
}
