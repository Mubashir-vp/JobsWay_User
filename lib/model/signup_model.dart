// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.userDetails,
  });

  String? status;
  UserDetails? userDetails;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userDetails": userDetails!.toJson(),
      };
}

class UserDetails {
  UserDetails({
    this.firstName,
    this.lastName,
    this.password,
    this.phone,
    this.email
  });

  String? firstName;
  String? lastName;
  String? password;
  String? phone;
  String? email;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        phone: json["phone"],
        email: json["email"]
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "phone": phone,
        "email":email,
      };
}
