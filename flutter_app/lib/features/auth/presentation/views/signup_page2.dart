import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/spaces.dart';
import 'package:flutter_app/core/utils/constants/university_constants.dart';
import 'package:flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_app/features/auth/domain/usecases/get_departments_usecase.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_dropdown.dart';
import 'package:flutter_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:flutter_app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

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
  int? selectedDepartmentId;
  Map<String, int> departmentMap = {};
  GetDepartmentsUsecase getDepartmentsUsecase = GetDepartmentsUsecase(
      AuthRepositoryImpl(
          remoteDataSource: AuthRemoteDataSource(client: http.Client())));

  @override
  void initState() {
    getDepartments();
    super.initState();
  }

  void getDepartments() async {
    await UniversityConstants.fetchDepartments(
        getDepartmentsUsecase, int.parse(widget.selectedInstitute));
    setState(() {      
    departmentMap = {
      for (int i = 0; i < UniversityConstants.departments.length; i++)
        UniversityConstants.departments[i]: i + 1
    };
    });
  }

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
                selectedDepartmentId = departmentMap[selectedDepartment];
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
                      'department': '$selectedDepartmentId',
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
