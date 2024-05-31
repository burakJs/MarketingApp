import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/extensions/string_extensions.dart';

class ErrorAlert extends StatelessWidget {
  ErrorAlert({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Error',
        style: context.general.textTheme.headlineMedium?.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content.fireErrorLocal,
        style: context.general.textTheme.titleLarge?.copyWith(),
      ),
      actions: [
        TextButton(
          onPressed: () => context.route.pop(),
          child: Text(
            'Ok',
            style: context.general.textTheme.titleLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
