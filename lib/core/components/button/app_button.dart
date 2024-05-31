import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

final class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.callBack});
  final String text;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalNormal,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.general.colorScheme.onSurface,
        ),
        onPressed: callBack,
        child: Padding(
          padding: context.padding.low,
          child: Text(
            text,
            style: context.general.textTheme.headline6?.copyWith(
              color: context.general.colorScheme.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
