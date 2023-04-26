import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modulearch/core/modules/user/presenter/cubits/user_cubit.dart';
import 'package:modulearch/core/shared/services/overlay/overlay_service.dart';
import 'package:modulearch/module/auth/domain/params/login_param.dart';
import 'package:modulearch/module/auth/presenter/cubits/login_cubit.dart';
import 'package:modulearch/module/auth/presenter/cubits/login_state.dart';

import '../../../../core/shared/services/snackbar/snackbar_service.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit loginCubit;
  final UserCubit userCubit;
  final OverlayService _overlayService;

  const LoginPage({
    super.key,
    required OverlayService overlayService,
    required this.loginCubit,
    required this.userCubit,
  }) : _overlayService = overlayService;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final StreamSubscription subscription;

  LoginCubit get loginCubit => widget.loginCubit;

  @override
  void initState() {
    super.initState();

    subscription = loginCubit.stream.listen((state) {
      if (state is! LoginLoadingState) {
        widget._overlayService.hide();
      }

      if (state is LoginLoadingState) {
        widget._overlayService.show();
      } else if (state is LoginSuccessState) {
        widget.userCubit.updateUser(state.user);
        Modular.to.pushReplacementNamed('/');
      } else if (state is LoginErrorState) {
        SnackbarService.instance
            .showSnackbar(SnackBar(content: Text(state.failure.message)));
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("Login"),
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Digite seu Email: ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Text(
                    "Digite sua Senha: ",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Senha"),
              ),
              // BlocBuilder<LoginCubit, LoginState>(
              //   bloc: loginCubit,
              //   builder: (_, state) {
              //     if (state is LoginLoadingState) {
              //       return const CircularProgressIndicator();
              //     }
              //     return Text(state.toString());
              //   },
              // ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<LoginCubit, LoginState>(
            bloc: loginCubit,
            builder: (context, state) {
              return FloatingActionButton.extended(
                onPressed: state is LoginLoadingState
                    ? null
                    : () async {
                        print('tapped');
                        final param = LoginParam(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        await widget.loginCubit.login(param);
                      },
                label: state is LoginLoadingState
                    ? const CircularProgressIndicator()
                    : const Text("Entrar"),
              );
            }));
  }
}
