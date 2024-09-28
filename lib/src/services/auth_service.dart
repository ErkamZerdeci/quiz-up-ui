// src/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_up_ui/src/models/response_modal.dart';
import 'package:quiz_up_ui/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _saveToken(response.body);
      return Response<String>(
          statusCode: response.statusCode, data: response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<Response<String>> signup(
      String email, String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json
          .encode({'email': email, 'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      _saveToken(response.body);
      return Response<String>(
          statusCode: response.statusCode, data: response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  //TODO : Delete this functino
  Future<Response<String>> test() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/test'),
      headers: {
        'Content-Type': 'application/json',
         'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Response<String>(
          statusCode: response.statusCode, data: response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
}
