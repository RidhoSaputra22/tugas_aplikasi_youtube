import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  static bool isLogin = false;
  static const String baseUrl =
      'http://localhost:3000'; // Use actual IP if needed

  static Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Register failed: ${response.body}');
      return false;
    }
  }

  static Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return User.fromJson(data['user']);
    } else {
      print('Login failed: ${response.body}');
      return null;
    }
  }
}
