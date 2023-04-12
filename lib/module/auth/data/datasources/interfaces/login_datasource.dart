import '../../../domain/params/login_param.dart';

abstract class LoginDatasource {
  Future<String> login(LoginParam param);
}
