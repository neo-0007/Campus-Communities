import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class SignupPage3 extends StatefulWidget {
  const SignupPage3({super.key});

  @override
  SignupPage3State createState() => SignupPage3State();
}

class SignupPage3State extends State<SignupPage3> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
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
              AuthBigText(text: 'Personal Details', fontSize: 24),
              Spaces.verySmallSpace,
              AuthSmallText(text: 'It\'s almost done!'),
              Spaces.largeSpace,
              CAuthFormField(
                controller: _nameController,
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              Spaces.smallSpace,
              CAuthFormField(
                controller: _usernameController,
                hintText: 'Username',
              ),
              Spaces.smallSpace,
              CAuthFormField(
                controller: _phoneController,
                hintText: 'Phone',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Phone number must be 10 digits';
                  }
                  return null;
                },
              ),
              Spaces.largeSpace,
              AuthButton(
                text: 'CONTINUE',
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    context.goNamed(AppRouteConstants.setpassword);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Form Submitted Successfully!')),
                    );
                  }
                },
              ),
              Spaces.verySmallSpace,
            ],
          ),
        ),
      ),
    );
  }
}
