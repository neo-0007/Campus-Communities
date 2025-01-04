import 'package:flutter_app/features/auth/domain/model/user.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase(this.authRepository);

  Future<User> execute(User user) async{
    return await authRepository.register(user);
  }
}
