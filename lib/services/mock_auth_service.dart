import 'dart:async';
import 'package:mcoalworks/models/user.dart';

class MockAuthService {
  bool _isLoggedIn = false;
  UserModel? _currentUser;

  final List<UserModel> _mockUsers = [
    UserModel(
      userId: 1,
      username: 'john_doe',
      email: 'john@example.com',
      phone: '123-456-7890',
      profileImage: 'https://i.pravatar.cc/150?img=1',
      isActive: true,
      isSupervisor: true,
    ),
    UserModel(
      userId: 2,
      username: 'jane_smith',
      email: 'jane@example.com',
      phone: '987-654-3210',
      profileImage: 'https://i.pravatar.cc/150?img=2',
      isActive: true,
      isSupervisor: false,
    ),
  ];

  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    final user = _mockUsers.firstWhere(
      (u) => u.email == email,
      orElse: () => throw Exception('User not found'),
    );

    if (password != '123456') { // Mock password check
      throw Exception('Invalid password');
    }

    _isLoggedIn = true;
    _currentUser = user;
    return user;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    _isLoggedIn = false;
    _currentUser = null;
  }

  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate check
    return _isLoggedIn;
  }

  Future<UserModel?> getUserData() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate fetch
    return _currentUser;
  }
}