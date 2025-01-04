import 'package:flutter_app/features/auth/domain/model/department.dart';
import 'package:flutter_app/features/auth/domain/model/institute.dart';
import 'package:flutter_app/features/auth/domain/usecases/get_departments_usecase.dart';
import 'package:flutter_app/features/auth/domain/usecases/get_institutes_usecase.dart';

class UniversityConstants {
  static List<String> institutes = [];

  static Future<void> fetchInstitutes(
      GetInstitutesUsecase getInstitutesUsecase) async {
    try {
      List<Institute> data = await getInstitutesUsecase.execute();
      institutes.clear();

      for (var institute in data) {
        institutes.add(institute.name);
      }
    } catch (e) {
      print('Error fetching institutes: $e');
    }
  }

  static List<String> departments = [];

  static Future<void> fetchDepartments(
      GetDepartmentsUsecase getDepartmentsUsecase, int instituteId) async{
    try {
      List<Department> data = await getDepartmentsUsecase.execute(instituteId);
      departments.clear();

      for (var department in data) {
        departments.add(department.name);
      }
    } catch (e) {
      print('Error fetching departments: $e');
    }
  }

  static const List<String> semesters = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  static const List<String> courses = [
    "B.Tech",
    "M.Tech",
    "PhD",
    "MSc",
    "MBA",
    "MA",
    "MCA",
    "BSc",
    "BA",
  ];
  // static const List<String> departments = [
  //   'CSE',
  //   'ECE',
  //   'EE',
  //   'FET',
  //   'ME',
  //   'CE',
  //   'PHY',
  //   'MATHS',
  //   'CHEM',
  // ];
}
