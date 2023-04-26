import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/cubits/user_cubit.dart';

class UserModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton(
      (i) => UserCubit(),
      export: true,
    ),
  ];
}
