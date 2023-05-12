import '/core/shared/services/auth/auth_service.dart';
import '/core/shared/services/auth/helpers/failures.dart';
import '/module/auth/data/datasources/interfaces/login_datasource.dart';
import '/module/auth/domain/failures/auth_failure.dart';
import '/module/auth/domain/params/login_param.dart';

class LoginDatasourceImpl implements LoginDatasource {
  const LoginDatasourceImpl(this._authService);
  final AuthService _authService;

  @override
  Future<String> login(LoginParam param) async {
    try {
      final response = await _authService.loginWithEmail(
        email: param.email,
        password: param.password,
      );

      return response.id;
    } on AuthServiceFailure catch (e) {
      throw AuthFailure(
        message: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }
}
