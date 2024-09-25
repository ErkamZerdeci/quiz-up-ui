import 'package:flutter/material.dart';
import 'package:quiz_up_ui/src/models/user_modal.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await _authService.login(email, password);
    notifyListeners(); 
  }

  Future<void> signup(String email, String username, String password) async {
    _user = await _authService.signup(email, username, password);
    notifyListeners(); // 
  }
}