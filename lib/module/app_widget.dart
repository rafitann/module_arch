import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/theme/presenter/cubits/theme_cubit.dart';
import 'package:modulearch/core/shared/services/snackbar/snackbar_service.dart';
import 'package:modulearch/core/shared/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modular.setInitialRoute("/auth/login");

    final themeCubit = Modular.get<ThemeCubit>();

    return BlocBuilder(
        bloc: themeCubit,
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.light;
          ThemeData lightTheme = AppTheme.pinkTheme;
          if (state == ThemeStyle.dark) {
            themeMode = ThemeMode.dark;
          } else if (state == ThemeStyle.blue) {
            lightTheme = AppTheme.blueTheme;
          } else if (state == ThemeStyle.purple) {
            lightTheme = AppTheme.purpleTheme;
          }

          return MaterialApp.router(
            themeMode: themeMode,
            darkTheme: ThemeData.dark(),
            theme: lightTheme,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            builder: Asuka.builder,
            scaffoldMessengerKey: SnackbarService.instance.scaffoldMessengerKey,
          );
        });
  }
}
