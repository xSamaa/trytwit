// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.password,
    this.nombre,
    this.apellidos,
    this.fechaNacimiento,
  });

  String email;
  String password;
  String nombre;
  String apellidos;
  DateTime fechaNacimiento;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellidos": apellidos,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
      };
}
