import 'package:flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_app/features/auth/domain/model/user.dart';
import 'package:flutter_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String email, String password) async {
    final response = await remoteDataSource.login(email, password);
    return User(
      id: response['user']['id'],
      name: response['user']['name'],
      userName: response['user']['username'],
      email: response['user']['email'],
      phone: response['user']['phone'],
      rollNumber: response['user']['roll_number'],
      semester: response['user']['semester'],
    );
  }

  @override
  Future<User> register(User user) async {
    final response =
        await remoteDataSource.signUp(user.email!, user.password!, user.name!);
    return User(
      id: response['id'],
    );
  }
}
