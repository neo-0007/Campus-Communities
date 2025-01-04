import 'package:flutter_app/core/error/user_data_validation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/widgets/custom_snackbar.dart';
import 'package:flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_app/features/auth/domain/usecases/login_usecase.dart';
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
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginUsecase loginUsecase = LoginUsecase(AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSource(client: http.Client())));

  @override
  void dispose() {
    _rollNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login(String email, String password) async {
    try {
      await loginUsecase.execute(email, password);
      if (!mounted) return;
      CustomSnackbar(
              snackBarBorderColor: Colors.green,
              snackBarColor: Colors.green,
              snackBarIcon: Icons.check_circle_outlined,
              snackBarText: 'Success',
              snackBarSubText: 'Succesfully logged in!')
          .show(context);
    } catch (e) {
      CustomSnackbar(
              snackBarBorderColor: Colors.red,
              snackBarColor: Colors.red,
              snackBarIcon: Icons.error_outline,
              snackBarText: 'Error',
              snackBarSubText: 'Login failed: $e')
          .show(context);
    }
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
                hintText: 'Roll Number',
                controller: _rollNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Roll Number';
                  } else if (!RegExp(InstituteFormats.tuRollNumberPattern)
                      .hasMatch(value)) {
                    return "Enter University mail!";
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
                    _login(
                        _rollNumberController.text, _passwordController.text);
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
