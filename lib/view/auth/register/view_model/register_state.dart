abstract class RegisterState {
  RegisterState();
}

class RegisterInitial extends RegisterState {
  RegisterInitial();
}

class RegisterLoading extends RegisterState {
  RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess();
}

class RegisterToSignIn extends RegisterState {
  RegisterToSignIn();
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
