// To parse this JSON data, do
//
//     final usersignup = usersignupFromJson(jsonString);

import 'dart:convert';

Usersignup usersignupFromJson(String str) => Usersignup.fromJson(json.decode(str));

String usersignupToJson(Usersignup data) => json.encode(data.toJson());

class Usersignup {
    Usersignup({
        this.userDetails,
    });

    UserDetails? userDetails;

    factory Usersignup.fromJson(Map<String, dynamic> json) => Usersignup(
        userDetails: UserDetails.fromJson(json["userDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "userDetails": userDetails!.toJson(),
    };
}

class UserDetails {
    UserDetails({
        this.firstName,
        this.lastName,
        this.phone,
        this.password,
    });

    String? firstName;
    String? lastName;
    String? phone;
    String? password;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
    };
}
