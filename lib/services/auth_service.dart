import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mcoalworks/models/user.dart';

class AuthService {
  static const String _baseUrl = 'https://bda7-49-249-229-42.ngrok-free.app/';
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success']) {
          final user = UserModel.fromJson(responseData['user']);
          await _secureStorage.write(
              key: 'auth_token', value: responseData['']);
          return user;
        } else {
          throw Exception('Login failed: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  Future<void> logout() async {
    try {
      final token = await _secureStorage.read(key: 'auth_token');
      if (token != null) {
        await http.post(
          Uri.parse('$_baseUrl/logout'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
      }
    } catch (e) {
      print('Logout error: $e');
    } finally {
      await _secureStorage.delete(key: 'auth_token');
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: 'auth_token');
    return token != null;
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }
}
