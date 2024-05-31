import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/components/alert/error_alert.dart';
import 'package:marketing_app/core/components/button/app_button.dart';
import 'package:marketing_app/core/components/circle_avatar/app_logo.dart';
import 'package:marketing_app/core/components/textFormField/auth_text_field.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:marketing_app/view/auth/login/view_model/login_bloc.dart';
import 'package:marketing_app/view/auth/login/view_model/login_state.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: context.padding.normal,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ErrorAlert(content: state.error);
                  },
                );
              }
              if (state is LoginSuccess) {
                context.router.replace(const HomeRoute());
              }

              if (state is LoginToRegister) {
                context.router.replace(const RegisterRoute());
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoginSuccess) {
                return const Center(child: Text('SA'));
              } else {
                return _loginPage(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Column _loginPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppLogo(radius: 70),
        context.sized.emptySizedHeightBoxNormal,
        context.sized.emptySizedHeightBoxNormal,
        AuthTextField(
          controller: context.read<LoginBloc>().emailController,
          title: 'Email',
        ),
        AuthTextField(
          controller: context.read<LoginBloc>().passwordController,
          title: 'Password',
        ),
        context.sized.emptySizedHeightBoxNormal,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: 'Register',
                  callBack: () {
                    context.read<LoginBloc>().clearTextfield();
                    context.read<LoginBloc>().goToRegister();
                  },
                ),
                AppButton(
                  text: 'Login',
                  callBack: () async {
                    context.read<LoginBloc>().login();
                  },
                ),
              ],
            ),
            AppButton(
              text: 'Forgot Password',
              callBack: () async {
                final String? result = await context.read<LoginBloc>().resetPass();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(result ?? 'Reset password email sent')));
              },
            ),
          ],
        )
      ],
    );
  }
}
