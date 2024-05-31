import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_app/core/base/service/auth/auth_manager.dart';
import 'package:marketing_app/core/base/service/auth/auth_service.dart';

import 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc()
      : _service = AuthManager(),
        super(RegisterInitial());

  final AuthService _service;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoading());
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty) {
      emit(RegisterError(error: 'Email cannot be empty'));
      return;
    }
    if (password.isEmpty) {
      emit(RegisterError(error: 'Password cannot be empty'));
      return;
    }
    final response = await _service.register(email, password);

    if (response == null) {
      navigatePage();
      return;
    }

    emit(RegisterError(error: response));
  }

  void navigatePage() {
    emit(RegisterSuccess());
    emit(RegisterInitial());
    clearTextfield();
  }

  void clearTextfield() {
    emailController.text = '';
    passwordController.text = '';
  }
}
