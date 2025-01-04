import 'package:flutter/material.dart';
import 'package:flutter_app/core/widgets/custom_loader_with_logo.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: CustomLoaderWithLogo()
    );
  }
}