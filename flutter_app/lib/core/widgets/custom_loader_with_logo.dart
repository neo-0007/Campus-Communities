import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/image_strings.dart';
import 'package:lottie/lottie.dart';

class CustomLoaderWithLogo extends StatelessWidget {
  const CustomLoaderWithLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular SVG animation
          SizedBox(
            width: 65,
            height: 65,
            child: Lottie.asset(
              ImageStrings.circularLoaderAnimation,
              repeat: true,
              frameRate: FrameRate(60),
            ),
          ),
          // App logo
          SizedBox(
            width: 35,
            height: 35,
            child: Image.asset(
              ImageStrings.logo,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
