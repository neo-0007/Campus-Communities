import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';

class Onboardingslide extends StatelessWidget {
  const Onboardingslide({
    super.key,
    required this.image,
    required this.title,
  });

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjusts to content size
        children: [
          Image.asset(
            image,
            width: HelperFunctions.getScreenSize(context).width * 0.6,
          ),
          SizedBox(height: HelperFunctions.getScreenSize(context).height * 0.03),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
