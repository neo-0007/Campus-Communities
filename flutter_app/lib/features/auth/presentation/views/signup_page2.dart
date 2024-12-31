import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/utils/constants/university_constants.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_dropdown.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2(
      {super.key,
      required this.selectedInstitute,
      required this.selectedEmail,
      required this.selectedRollNumber});

  final String selectedInstitute;
  final String selectedEmail;
  final String selectedRollNumber;

  @override
  SignupPage2State createState() => SignupPage2State();
}

class SignupPage2State extends State<SignupPage2> {
  String? selectedSemester;
  String? seletectedCourse;
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: Spaces.allMediumPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthBigText(
              text: 'Academic Details',
              fontSize: 24,
            ),
            Spaces.largeSpace,
            CDropdownButtonTheme.lightTheme(
                context,
                UniversityConstants.semesters,
                selectedSemester,
                'Semester', (newValue) {
              setState(() {
                selectedSemester = newValue;
              });
            }),
            Spaces.smallSpace,
            CDropdownButtonTheme.lightTheme(
                context,
                UniversityConstants.courses,
                seletectedCourse,
                'Course', (newValue) {
              seletectedCourse = newValue;
            }),
            Spaces.smallSpace,
            CDropdownButtonTheme.lightTheme(
                context,
                UniversityConstants.departments,
                selectedDepartment,
                'Department', (newValue) {
              setState(() {
                selectedDepartment = newValue;
              });
            }),
            Spaces.largeSpace,
            AuthButton(
                text: 'CONTINUE',
                onPressed: () {
                  context.goNamed(
                    AppRouteConstants.signup3,
                    pathParameters: {
                      'institute': widget.selectedInstitute,
                      'email': widget.selectedEmail,
                      'rollNumber': widget.selectedRollNumber,
                      'department': selectedDepartment!,
                      'semester': selectedSemester!,
                      'course': seletectedCourse!,
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
