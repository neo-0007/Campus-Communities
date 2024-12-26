import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.arrowIs = true});

  final String text;
  final void Function() onPressed;
  final bool arrowIs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: HelperFunctions.getScreenSize(context)
          .width, 
      child: ElevatedButton(
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: arrowIs
              ? Row(
                  children: [
                    Text(
                      text,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
        ),
      ),
    );
  }
}
