import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';
import 'package:flutter_app/core/utils/constants/image_strings.dart';
import 'package:flutter_app/features/onboarding/presentation/widgets/onboardingslide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the auto-scrolling timer
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == 2) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView occupies the full screen
          PageView(
            controller: _pageController,
            children: [
              Onboardingslide(
                  image: ImageStrings.onboarding1, title: 'Explore'),
              Onboardingslide(
                  image: ImageStrings.onboarding2, title: 'Connect'),
              Onboardingslide(
                  image: ImageStrings.onboarding3, title: 'Achieve'),
            ],
          ),
          // SmoothPageIndicator and button at the bottom
          Positioned(
            bottom: HelperFunctions.getScreenSize(context).height / 4.2, // Distance from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 3,
                  dotWidth: 8,
                  activeDotColor: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: HelperFunctions.getScreenSize(context).width * 0.25, // Distance from the bottom
            child: SizedBox(
              height: 30,
              width: HelperFunctions.getScreenSize(context).width / 2, // Explicit height for the button
              child: ElevatedButton(
                onPressed: () {
                  // Handle Get Started button press
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'GET STARTED',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
