import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/user/user_module.dart';
import 'package:modulearch/module/auth/auth_module.dart';

import '../core/shared/guards/auth_guard.dart';
import '../core/shared/services/auth/firebase_auth_service.dart';
import '../core/shared/services/firestore/firebase_firestore_service.dart';
import '../core/shared/services/overlay/asuka_overlay_service.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    UserModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => FirebaseAuthService()),
    Bind.lazySingleton((i) => FirebaseFirestoreService()),
    Bind.lazySingleton((i) => AsukaOverlayService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute("/", module: HomeModule(), guards: [AuthGuard()]),
  ];
}
