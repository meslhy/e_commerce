/// message : "success"
/// user : {"name":"yousef","email":"useifmeslhy@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDgxZTQ3ZWNiNTM5MTZmZGI0NTBkYSIsIm5hbWUiOiJ5b3VzZWYiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5OTIyNTE5MSwiZXhwIjoxNzA3MDAxMTkxfQ.pddSB4AarmKO1gVVbf5incgG5zfwtWwnS8OyhV6bnPs"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// name : "yousef"
/// email : "useifmeslhy@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}