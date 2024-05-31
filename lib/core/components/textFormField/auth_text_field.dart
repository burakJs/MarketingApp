import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.title, this.controller});
  final String title;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.verticalLow,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.general.textTheme.headlineSmall,
              ),
            ],
          ),
          context.sized.emptySizedHeightBoxLow,
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: context.padding.low,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: context.general.colorScheme.onSurface,
                ),
                borderRadius: context.border.lowBorderRadius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: context.general.colorScheme.onSurface.withOpacity(0.7),
                ),
                borderRadius: context.border.lowBorderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 4,
                  color: context.general.colorScheme.onSurface.withOpacity(0.7),
                ),
                borderRadius: context.border.lowBorderRadius,
              ),
            ),
            style: context.general.textTheme.titleLarge,
            obscureText: title == 'Password',
          ),
        ],
      ),
    );
  }
}
