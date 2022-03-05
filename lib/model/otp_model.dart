// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
    Otp({
        this.user,
        this.token,
    });

    User? user;
    String? token;

    factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
    };
}

class User {
    User({
        this.id,
        this.phone,
        this.password,
        this.name,
        this.ban,
        this.email,
        this.count,
        this.premium,
        this.authmode,
    });

    String? id;
    String? phone;
    String? password;
    String? name;
    bool? ban;
    String? email;
    int? count;
    bool? premium;
    String? authmode;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        phone: json["phone"],
        password: json["password"],
        name: json["name"],
        ban: json["ban"],
        email: json["email"],
        count: json["count"],
        premium: json["premium"],
        authmode: json["authmode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "password": password,
        "name": name,
        "ban": ban,
        "email": email,
        "count": count,
        "premium": premium,
        "authmode": authmode,
    };
}
