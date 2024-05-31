import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/color_constants.dart';
import '../../extensions/num_extensions.dart';
import '../appbar/appbar.dart';

class CustomScaffold extends StatelessWidget {
  final bool isThereAppbar;
  final EdgeInsetsGeometry? padding;
  final Widget body;
  final Widget? bottomNavigationBar;

  final FloatingActionButton? floatingActionButton;
  final String? appbarTitle;
  final List<Widget>? actions;
  final bool isNoPaddingTop;
  final bool isThereLeading;

  const CustomScaffold({
    Key? key,
    this.isThereAppbar = true,
    required this.body,
    this.floatingActionButton,
    this.padding,
    this.appbarTitle,
    this.actions,
    this.isNoPaddingTop = false,
    this.bottomNavigationBar,
    this.isThereLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isThereAppbar
          ? CustomAppbar(
              actions: actions,
              title: appbarTitle,
              isThereLeading: isThereLeading,
            )
          : null,
      backgroundColor: ColorConstants.instance?.alabaster,
      body: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              isThereAppbar
                  ? 0.ph
                  : isNoPaddingTop
                      ? 0.ph
                      : 1.h.ph,
              body,
              1.h.ph,
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
