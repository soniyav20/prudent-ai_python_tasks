import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final storage = const FlutterSecureStorage();

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.91.174:8000/api/token/'),
      body: {'username': username, 'password': password},
    );
    print(response);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      await storage.write(key: 'access', value: data['access']);
      await storage.write(key: 'refresh', value: data['refresh']);
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'access');
  }

  Future<void> logout() async {
    await storage.deleteAll();
  }
}

