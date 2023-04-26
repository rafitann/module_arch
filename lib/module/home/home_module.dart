import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/theme/presenter/cubits/theme_cubit.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_cubit.dart';
import 'package:modulearch/module/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (_, __) => HomePage(
        userCubit: Modular.get<UserCubit>(),
        themeCubit: Modular.get<ThemeCubit>(),
      ),
    ),
  ];
}
