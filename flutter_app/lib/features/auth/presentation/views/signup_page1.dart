import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/utils/constants/university_constants.dart';
import 'package:flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_app/features/auth/domain/usecases/get_institutes_usecase.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_dropdown.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:flutter_app/core/error/user_data_validation.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SignupPage1 extends StatefulWidget {
  const SignupPage1({super.key});

  @override
  SignupPage1State createState() => SignupPage1State();
}

class SignupPage1State extends State<SignupPage1> {
  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? selectedInstitute;
  int? selectedInstituteId;
  Map<String, int> instituteMap = {};
  GetInstitutesUsecase getInstitutesUsecase = GetInstitutesUsecase(
      AuthRepositoryImpl(
          remoteDataSource: AuthRemoteDataSource(client: http.Client())));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _instituteController.dispose();
    _rollNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAllInstitutes();
    super.initState();
  }

  void getAllInstitutes() async {
    await UniversityConstants.fetchInstitutes(getInstitutesUsecase);

    setState(() {
      instituteMap = {
      for (int i = 0; i < UniversityConstants.institutes.length; i++)
        UniversityConstants.institutes[i]: i + 1
    };
    });
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
              CDropdownButtonTheme.lightTheme(
                context,
                UniversityConstants.institutes,
                selectedInstitute,
                'Institute',
                (newValue) {
                  setState(() {
                    selectedInstitute = newValue;
                    selectedInstituteId = instituteMap[selectedInstitute];
                  });
                },
              ),
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
                    context.goNamed(AppRouteConstants.signup2, pathParameters: {
                      'institute': '$selectedInstituteId',
                      'rollNumber': _rollNumberController.text,
                      'email': _emailController.text
                    });
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
