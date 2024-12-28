import 'dart:convert';

import 'package:flutter_app/core/utils/constants/apiconstants.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await client.post(
      Uri.parse(Apiconstants.login),
      body: json.encode({'roll_number': email, 'password': password}),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signUp(
      String email, String password, String name) async {
    final response = await client.post(
      Uri.parse(Apiconstants.register),
      body: json.encode({'email': email, 'password': password, 'name': name}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
