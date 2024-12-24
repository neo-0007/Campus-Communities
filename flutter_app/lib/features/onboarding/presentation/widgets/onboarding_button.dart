import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: HelperFunctions.getScreenSize(context).width /
          2, // Explicit height for the button
      child: ElevatedButton(
        onPressed: () {
          // Handle Get Started button press
        },
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
