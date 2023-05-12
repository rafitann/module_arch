import 'package:flutter_modular/flutter_modular.dart';
import '/module/auth/data/datasources/implementations/login_datasource_impl.dart';
import '/module/auth/data/repositories/login_repository.dart';
import '/module/auth/domain/usecases/login_usecase.dart';
import '/module/auth/presenter/pages/login_page.dart';

import '../../core/modules/user/presenter/cubits/user_cubit.dart';
import '../../core/shared/services/overlay/overlay_service.dart';
import 'data/datasources/implementations/user_datasource_impl.dart';
import 'presenter/cubits/login_cubit.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/login",
      child: (context, args) => LoginPage(
        loginCubit: Modular.get<LoginCubit>(),
        overlayService: Modular.get<OverlayService>(),
        userCubit: Modular.get<UserCubit>(),
      ),
    ),
  ];

  @override
  final List<Bind<Object>> binds = [
    Bind.factory((i) => LoginUseCaseImpl(loginRepository: i())),
    Bind.lazySingleton((i) => LoginRepositoryImpl(i(), i())),
    Bind.lazySingleton((i) => LoginDatasourceImpl(i())),
    Bind.lazySingleton((i) => UserDatasourceImpl(i())),
    Bind.factory((i) => LoginCubit(loginUseCase: i())),
  ];
}
