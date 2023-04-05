import 'package:modulearch/core/shared/interfaces/app_failure.dart';

class AuthFailure extends AppFailure {
  const AuthFailure({required super.message, required super.stackTrace});
}
