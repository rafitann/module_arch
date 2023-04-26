import '../../../interfaces/app_failure.dart';

class AuthServiceFailure extends AppFailure {
  AuthServiceFailure({
    required super.message,
    required super.stackTrace,
  });
}
