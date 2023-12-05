import 'dart:convert';

import 'package:e_commerce/data/model/responses/AuthResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsUtils {

  saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user.toJson()));
  }

  saveToken(String token)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);

  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAsString = prefs.getString("user");
    if (userAsString == null) return null;
    return User.fromJson(jsonDecode(userAsString));
  }

  Future<String?> getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}