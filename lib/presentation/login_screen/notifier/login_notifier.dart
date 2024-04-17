import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:yahya_s_application1/presentation/login_screen/models/login_model.dart';
part 'login_state.dart';

final loginNotifier = StateNotifierProvider<LoginNotifier, LoginState>((ref) =>
    LoginNotifier(LoginState(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: false,
        loginModelObj: LoginModel())));

/// A notifier that manages the state of a Login according to the event that is dispatched to it.
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(LoginState state) : super(state);

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword));
  }
}
