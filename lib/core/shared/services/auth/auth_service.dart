import 'helpers/responses.dart';

abstract class AuthService {
  Future<LoginResponse> loginWithEmail({
    required String email,
    required String password,
  });
}
