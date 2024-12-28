import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/utils/constants/university_constants.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_dropdown.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:flutter_app/core/error/user_data_validation.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart'; 

class SignupPage1 extends StatefulWidget {
  const SignupPage1({super.key});

  @override
  SignupPage1State createState() => SignupPage1State();
}

class SignupPage1State extends State<SignupPage1> {

  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? selectedUniversity;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {

    _instituteController.dispose();
    _rollNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Spaces.allMediumPadding,
        child: Form(
          key: _formKey, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBigText(text: 'Create Account', fontSize: 24),
              Spaces.verySmallSpace,
              AuthSmallText(
                  text: 'Enter your Academic Details and get Started!'),
              Spaces.largeSpace,
              CDropdownButtonTheme.lightTheme(context,UniversityConstants.universities,selectedUniversity, 'Institute'),
              Spaces.smallSpace,
              CAuthFormField(
                controller: _rollNumberController,
                hintText: 'Roll Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your roll number';
                  } else if (!RegExp(InstituteFormats.tuRollNumberPattern)
                      .hasMatch(value)) {
                    return 'Invalid Roll Number';
                  }
                  return null;
                },
              ),
              Spaces.smallSpace,
              CAuthFormField(
                controller: _emailController, 
                hintText: 'Mail',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(InstituteFormats.tuEmailPattern)
                      .hasMatch(value)) {
                    return 'Enter University Mail';
                  }
                  return null;
                },
              ),
              Spaces.largeSpace,
              AuthButton(
                text: 'CONTINUE',
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    context.goNamed(AppRouteConstants.signup2);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Form Submitted Successfully!')),
                    );
                  }
                },
              ),
              Spaces.verySmallSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthSmallText(text: 'Already have an account? '),
                  InkWell(
                    onTap: () {
                      context.goNamed(AppRouteConstants.login);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
