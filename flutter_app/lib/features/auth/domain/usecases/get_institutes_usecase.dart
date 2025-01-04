import 'package:flutter_app/features/auth/domain/model/institute.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repository.dart';

class GetInstitutesUsecase {
  final AuthRepository repository;

  GetInstitutesUsecase(this.repository);

  Future<List<Institute>> execute() async {
    return await repository.getAllInstitutes();
  }
}