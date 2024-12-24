import 'package:flutter/material.dart';

class AuthBigText extends StatelessWidget {
  const AuthBigText({super.key, required this.text, this.fontSize = 28});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: fontSize,
            ));
  }
}

class AuthSmallText extends StatelessWidget {
  const AuthSmallText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelSmall);
  }
}
