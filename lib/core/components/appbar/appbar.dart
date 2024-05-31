import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/app/color_constants.dart';
import '../text/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.title, this.actions, this.isThereLeading = true});
  final String? title;
  final List<Widget>? actions;
  final bool isThereLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.instance?.alabaster,
      elevation: 0,
      leading: isThereLeading ? _leadinIconButton(context) : null,
      actions: actions,
      centerTitle: true,
      title: CustomText(
        title,
        textStyle: context.general.textTheme.headline5
            ?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w600),
      ),
    );
  }

  IconButton _leadinIconButton(BuildContext context) {
    return IconButton(
        onPressed: () => context.router.pop(),
        icon: Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: ColorConstants.instance?.mainColor,
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
