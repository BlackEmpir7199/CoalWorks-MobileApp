import 'package:flutter/material.dart';
import 'package:mcoalworks/services/auth_service.dart';
import 'package:mcoalworks/models/user.dart';
import 'package:mcoalworks/services/mock_auth_service.dart';

class AuthProvider with ChangeNotifier {
  final MockAuthService _authService = MockAuthService();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authService.login(email, password);
      notifyListeners();
    } catch (e) {
      _user = null;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.logout();
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      final isLoggedIn = await _authService.isLoggedIn();
      if (isLoggedIn) {
        // Fetch user data from API or local storage when implemented
        // _user = await _authService.getUserData();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}