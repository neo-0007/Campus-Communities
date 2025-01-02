import 'package:flutter_app/features/auth/domain/model/department.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repository.dart';

class GetDepartmentsUsecase {
  final AuthRepository repository;

  GetDepartmentsUsecase(this.repository);

  Future<List<Department>> execute(int id) async {
    return await repository.getDepartmentsOfInstitute(id);
  }
}