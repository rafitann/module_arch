import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/user/user_module.dart';

import '../core/modules/theme/theme_module.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    ...UserModule().binds,
    ...ThemeModule().binds,
  ];
}
