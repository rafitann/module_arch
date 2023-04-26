import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/cubits/theme_cubit.dart';

class ThemeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.singleton((i) => ThemeCubit(), export: true),
  ];
}
