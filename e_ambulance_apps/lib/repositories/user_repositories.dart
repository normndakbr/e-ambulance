import 'dart:convert';
import '../models/user_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<UserLogin> login(String username, String password) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
    var apiResult = await http.post(url, body: {
      "username": username.toString().toLowerCase(),
      "password": password,
    });
    var jsonObject = json.decode(apiResult.body);
    return UserLogin.createUserLogin(jsonObject);
  }
}
