import 'package:flutter/material.dart';

class HelperFunctions {
  // Function to get screen size
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}