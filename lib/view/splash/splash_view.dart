import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:marketing_app/core/base/service/auth/auth_manager.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      final currentUser = AuthManager().currentUser;
      if (currentUser != null) {
        context.router.replace(const MainRoute(children: [HomeRoute()]));
        return;
      }
      context.router.replace(const LoginRoute());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.instance?.alabaster,
      width: context.sized.width,
      height: context.sized.height,
      child: Column(
        children: [
          20.h.ph,
          Lottie.asset("assets/lottie/splash_lottie.json"),
          10.h.ph,
          CustomText(
            "Easy Shopping",
            textStyle: context.general.textTheme.headline3
                ?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
          ),
          28.h.ph,
          CustomText(
            "Yükleniyor ...",
            textStyle: context.general.textTheme.headline6?.copyWith(color: ColorConstants.instance?.cadetBlue),
          )
        ],
      ),
    );
  }
}
