import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String password;
  final String photo;

  UserModel({
    required this.name, 
    required this.email,
    required this.password,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'photo': photo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
