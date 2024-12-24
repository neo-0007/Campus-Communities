import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  SetPasswordPageState createState() => SetPasswordPageState();
}

class SetPasswordPageState extends State<SetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              AuthBigText(text: 'Set Password', fontSize: 24),
              Spaces.verySmallSpace,
              AuthSmallText(text: 'Make it long and keep it a secret!'),
              Spaces.largeSpace,

              // Password Field
              CAuthFormField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              Spaces.smallSpace,

              // Confirm Password Field
              CAuthFormField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              Spaces.largeSpace,

              // Submit Button
              AuthButton(
                text: 'JOIN THE COMMUNITY',
                arrowIs: false,
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Password Set Successfully!')),
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
