import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.general.colorScheme.onSurface,
      child: Text(
        'MA',
        style: context.general.textTheme.displaySmall?.copyWith(
          color: context.general.colorScheme.background,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
