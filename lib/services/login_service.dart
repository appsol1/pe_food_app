import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pe_food_app/common/constants.dart';
import 'package:pe_food_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static User? loggedInUser;

  Future<User> login(String email, String password) async {
    var url = Uri.parse('https://dmapp.pureelements.ae/auth/login');
    try {
      var response = await http.post(url,
          body: {'email': email, 'password': password}, headers: {'Content-Type': 'application/x-www-form-urlencoded'});
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return User.fromJson(jsonDecode(response.body)['data']);
      } else {
        // Parse error response
        try {
          final errorResponse = jsonDecode(response.body);
          throw errorResponse['message'] ?? 'An unknown error occured. Try again later';
        } catch (e) {
          rethrow;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  initUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString(Constants.userStorageKey);
    if (userStr != null) {
      loggedInUser = User.fromJson(jsonDecode(userStr));
    }
  }

  cacheUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.userStorageKey, jsonEncode(user.toJson()));
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Constants.userStorageKey);
  }
}
