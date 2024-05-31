import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/core/base/service/auth/auth_manager.dart';
import 'package:marketing_app/core/base/service/auth/auth_service.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc()
      : _service = AuthManager(),
        super(LoginInitial());

  final AuthService _service;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty) {
      emit(LoginError(error: 'Please check email'));
      return;
    }

    if (password.isEmpty) {
      emit(LoginError(error: 'Please check password'));
      return;
    }

    String? error = await _service.login(emailController.text, passwordController.text);
    if (error != null) {
      emit(LoginError(error: error));
      return;
    }

    if (_service.currentUser == null) {
      emit(LoginError(error: 'User not found'));
      return;
    }

    navigatePage();
  }

  void clearTextfield() {
    emailController.text = '';
    passwordController.text = '';
  }

  void navigatePage() {
    emit(LoginSuccess());
    emit(LoginInitial());
    clearTextfield();
  }

  void goToRegister() {
    emit(LoginToRegister());
  }

  Future<String?> resetPass() async {
    if (emailController.text.trim() == '') {
      return 'Please check email';
    }
    String? result = await _service.resetPassword(emailController.text.trim());
    return result;
  }
}
