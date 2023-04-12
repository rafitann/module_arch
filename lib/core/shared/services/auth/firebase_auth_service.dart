import 'package:modulearch/core/shared/services/auth/helpers/responses.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<LoginResponse> loginWithEmail({
    required String email,
    required String password,
  }) async {
    return const LoginResponse(id: 'abc');
  }
}
