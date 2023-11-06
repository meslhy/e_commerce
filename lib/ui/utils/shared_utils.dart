// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefsUtils {
//   saveUser(User user) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("user", jsonEncode(user.toJson()));
//   }
//
//   Future<User?> getUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userAsString = prefs.getString("user");
//     if (userAsString == null) return null;
//     return User.fromJson(jsonDecode(userAsString));
//   }
// }