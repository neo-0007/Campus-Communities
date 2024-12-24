import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: HelperFunctions.getScreenSize(context).width /
          2, 
      child: ElevatedButton(
        onPressed:onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
