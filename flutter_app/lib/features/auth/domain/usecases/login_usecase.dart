import 'package:flutter_app/features/auth/domain/model/user.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<User> execute(String email,String password) async {
    return await repository.login(email,password);
  }
}