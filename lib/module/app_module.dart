import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/module/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/auth", module: AuthModule()),
      ];
}
