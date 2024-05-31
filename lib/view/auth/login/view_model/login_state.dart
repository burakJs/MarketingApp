abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}

class LoginToRegister extends LoginState {
  LoginToRegister();
}
