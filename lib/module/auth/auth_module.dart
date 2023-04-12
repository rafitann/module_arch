import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/module/auth/data/datasources/implementations/login_datasource_impl.dart';
import 'package:modulearch/module/auth/data/repositories/login_repository.dart';
import 'package:modulearch/module/auth/domain/usecases/login_usecase.dart';

import 'data/datasources/implementations/user_datasource_impl.dart';
import 'presenter/cubits/login_cubit.dart';

class AuthModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory((i) => LoginUseCaseImpl(loginRepository: i())),
    Bind.lazySingleton((i) => LoginRepositoryImpl(i(), i())),
    Bind.lazySingleton((i) => LoginDatasourceImpl(i())),
    Bind.lazySingleton((i) => UserDatasourceImpl(i())),
    Bind.factory((i) => LoginCubit()),
    // Bind.singleton((i) => UserCubit()),
  ];
}
