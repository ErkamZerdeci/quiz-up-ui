import 'package:flutter/material.dart';
import 'package:quiz_up_ui/src/models/response_modal.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<Response<String>> login(String username, String password) async {
    final response = await _authService.login(username, password);
    notifyListeners(); 
    return response;
  }

  Future<Response<String>> signup(String email, String username, String password) async {
    final response = await _authService.signup(email, username, password);
    notifyListeners(); 
    return response;
  }
}