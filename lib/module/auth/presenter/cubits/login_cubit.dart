import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';
import 'package:modulearch/module/auth/domain/usecases/login_usecase.dart';
import 'package:modulearch/module/auth/presenter/cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginInitialState());

  Future<void> login(LoginParam loginParam) async {
    emit(const LoginLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    final response = await _loginUseCase(loginParam);

    response.fold(
      (l) => emit(LoginErrorState(l)),
      (r) => emit(LoginSuccessState(r)),
    );

    print(state);
  }
}
