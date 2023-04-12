import 'package:modulearch/core/shared/services/auth/auth_service.dart';
import 'package:modulearch/module/auth/data/datasources/interfaces/login_datasource.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final AuthService _authService;

  const LoginDatasourceImpl(this._authService);

  @override
  Future<String> login(LoginParam param) async {
    final response = await _authService.loginWithEmail(
      email: param.email,
      password: param.password,
    );

    return response.id;
  }
}
