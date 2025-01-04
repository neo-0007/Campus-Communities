import 'package:flutter_app/features/auth/domain/model/department.dart';
import 'package:flutter_app/features/auth/domain/model/institute.dart';
import 'package:flutter_app/features/auth/domain/model/user.dart';

abstract class AuthRepository {
  Future<User> login(String email,String password);
  Future<User> register(User user);
  Future<List<Institute>> getAllInstitutes();
  Future<List<Department>> getDepartmentsOfInstitute(int id);
}