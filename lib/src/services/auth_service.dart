// src/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_up_ui/src/models/response_modal.dart';

class AuthService {
  final String baseUrl =
      'http://localhost:8090/auth'; // Replace with your BE URL

  Future<Response<String>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return Response<String>(statusCode: response.statusCode, data: response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<Response<String>> signup(String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json
          .encode({'email': email, 'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final result =
          Response<String>(statusCode: response.statusCode, data: response.body);
      return result;
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
