import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/user_data_validation.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/widgets/custom_snackbar.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              // Big Text
              AuthBigText(text: 'Login'),
              Spaces.verySmallSpace,
              // Small Text
              AuthSmallText(text: 'Ahh A Member I see, Welcome Back'),
              Spaces.largeSpace,
              // Email TextField
              CAuthFormField(
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(InstituteFormats.tuEmailPattern)
                      .hasMatch(value)) {
                    return 'Enter a valid University email';
                  }
                  return null;
                },
              ),
              Spaces.smallSpace,
              // Password TextField
              CAuthFormField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              Spaces.mediumSpace,
              // Login Button
              AuthButton(
                arrowIs: false,
                text: 'SIGN IN',
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    CustomSnackbar(snackBarBorderColor: Colors.green,snackBarColor: Colors.green,snackBarIcon: Icons.check_circle_outlined,snackBarText: 'Success',snackBarSubText: 'Your data was entried!').show(context);
                  }
                },
              ),
              Spaces.verySmallSpace,
              // Don't have an account? Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthSmallText(text: 'Don\'t have an account? '),
                  InkWell(
                    onTap: () {
                      context.go('/signup1');
                    },
                    child: Text(
                      'Register',
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
