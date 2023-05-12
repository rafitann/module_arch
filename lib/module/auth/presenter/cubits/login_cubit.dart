import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/module/auth/domain/params/login_param.dart';
import '/module/auth/domain/usecases/login_usecase.dart';
import '/module/auth/presenter/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginInitialState());
  final LoginUseCase _loginUseCase;

  Future<void> login(LoginParam loginParam) async {
    emit(const LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    final response = await _loginUseCase(loginParam);

    response.fold(
      (l) => emit(LoginErrorState(l)),
      (r) => emit(LoginSuccessState(r)),
    );

    debugPrint(state.toString());
  }
}
