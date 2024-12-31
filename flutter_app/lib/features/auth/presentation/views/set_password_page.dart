import 'package:flutter_app/features/auth/domain/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage(
      {super.key,
      required this.selectedInstitute,
      required this.selectedEmail,
      required this.selectedRollNumber,
      required this.selectedDepartment,
      required this.selectedSemester,
      required this.selectedCourse,
      required this.selectedName,
      this.selectedUserName,
      required this.selectedPhone});

  final String selectedInstitute;
  final String selectedEmail;
  final String selectedRollNumber;
  final String selectedDepartment;
  final String selectedSemester;
  final String selectedCourse;
  final String selectedName;
  final String? selectedUserName;
  final String selectedPhone;

  @override
  SetPasswordPageState createState() => SetPasswordPageState();
}

class SetPasswordPageState extends State<SetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignupUsecase signupUsecase = SignupUsecase(AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSource(client: http.Client())));

  _register(User user) async {
    final response = signupUsecase.execute(
      User(
        email: user.email,
        institute: user.institute,
        course: user.course,
        department: user.department,
        name: user.name,
        password: user.password,
        phone: user.phone,
        rollNumber: user.rollNumber,
        semester: user.semester,
        userName: user.userName,
      ),
    );
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
                    _register(
                      User(
                          email: widget.selectedEmail,
                          department: widget.selectedDepartment,
                          course: widget.selectedCourse,
                          institute: widget.selectedInstitute,
                          name: widget.selectedName,
                          password: _passwordController.text,
                          phone: widget.selectedPhone,
                          rollNumber: widget.selectedRollNumber,
                          semester: int.parse(widget.selectedSemester),
                          userName: widget.selectedUserName),
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
