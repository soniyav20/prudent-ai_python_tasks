import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl = 'http://192.168.91.174:8000/api/v2/';
  final storage = const FlutterSecureStorage();

  Future<http.Response?> uploadImage(String filePath) async {
    final token = await storage.read(key: 'access');
    if (token == null) return null;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${baseUrl}image/'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(await http.MultipartFile.fromPath('image', filePath));

    var streamedResponse = await request.send();
    return http.Response.fromStream(streamedResponse);
  }

  Future<Map<String, dynamic>?> fetchImageDetails(int id) async {
    final token = await storage.read(key: 'access');
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('${baseUrl}image/$id/'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);

    } else {
      return null;
    }
  }
}
