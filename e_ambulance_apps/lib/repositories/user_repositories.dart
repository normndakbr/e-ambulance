import 'dart:convert';
import '../models/user_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<UserLogin> login(String username, String password) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);

    // print("Url => " + url.toString());
    // print("username => " + username);
    // print("password => " + password);

    var apiResult = await http.post(url, body: {
      "username": username,
      "password": password,
    });

    var jsonObject = json.decode(apiResult.body);
    // print(jsonObject);
    return UserLogin.createUserLogin(jsonObject);
  }
}
