import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/components/alert/error_alert.dart';
import 'package:marketing_app/core/components/button/app_button.dart';
import 'package:marketing_app/core/components/circle_avatar/app_logo.dart';
import 'package:marketing_app/core/components/textFormField/auth_text_field.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:marketing_app/view/auth/register/view_model/register_bloc.dart';
import 'package:marketing_app/view/auth/register/view_model/register_state.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: context.padding.normal,
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                _errorDialog(context, state);
              }
              if (state is RegisterSuccess) {
                context.router.replace(const LoginRoute());
              }
            },
            builder: (context, state) {
              if (state is RegisterInitial) {
                return _registerPage(context, state);
              }
              if (state is RegisterLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return _registerPage(context, state);
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _errorDialog(BuildContext context, RegisterError state) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorAlert(content: state.error);
        });
  }

  Column _registerPage(BuildContext context, RegisterState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppLogo(radius: 70),
        context.sized.emptySizedHeightBoxNormal,
        context.sized.emptySizedHeightBoxNormal,
        AuthTextField(controller: context.read<RegisterBloc>().emailController, title: 'Email'),
        AuthTextField(controller: context.read<RegisterBloc>().passwordController, title: 'Password'),
        AppButton(
          text: 'Register',
          callBack: () async {
            context.read<RegisterBloc>().register();
          },
        ),
        AppButton(
          text: 'Sign In',
          callBack: () async {
            context.read<RegisterBloc>().clearTextfield();
            context.router.replace(const LoginRoute());
          },
        )
      ],
    );
  }
}
