import 'package:modulearch/core/shared/services/auth/helpers/responses.dart';

import 'auth_service.dart';
import 'helpers/failures.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<LoginResponse> loginWithEmail({
    required String email,
    required String password,
  }) async {
    if (email != 'daniel.noronha@fteam.dev') {
      throw AuthServiceFailure(
          message: 'Invalid email', stackTrace: StackTrace.current);
    }
    return const LoginResponse(id: 'abc');
  }
}
