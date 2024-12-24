import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/helper_functions.dart';
import 'package:flutter_app/core/utils/constants/image_strings.dart';
import 'package:flutter_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:flutter_app/features/onboarding/presentation/widgets/onboardingslide.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();

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

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

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

          Positioned(
            bottom: HelperFunctions.getScreenSize(context).height /
                4.2,
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
            bottom: 60,
            left: HelperFunctions.getScreenSize(context).width *
                0.25, 
            child: OnboardingButton(text: 'GET STARTED',onPressed: () => context.goNamed(AppRouteConstants.signup1),),
          ),
        ],
      ),
    );
  }
}
