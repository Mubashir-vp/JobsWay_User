// To parse this JSON data, do
//
//     final topcompanies = topcompaniesFromJson(jsonString);

import 'dart:convert';

List<Topcompanies> topcompaniesFromJson(String str) => List<Topcompanies>.from(json.decode(str).map((x) => Topcompanies.fromJson(x)));

String topcompaniesToJson(List<Topcompanies> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topcompanies {
    Topcompanies({
        this.id,
        this.companyName,
        this.industry,
        this.location,
        this.email,
        this.bio,
        this.phone,
        this.website,
        this.linkedin,
        this.facebook,
        this.instagram,
        this.password,
        this.logoUrl,
        this.status,
        this.ban,
        this.linkedIn,
        this.twitter,
        this.confirmPassword,
    });

    String? id;
    String? companyName;
    String? industry;
    String? location;
    String? email;
    String? bio;
    String? phone;
    String? website;
    String? linkedin;
    String? facebook;
    String? instagram;
    String? password;
    String? logoUrl;
    bool? status;
    bool? ban;
    String? linkedIn;
    String? twitter;
    String? confirmPassword;

    factory Topcompanies.fromJson(Map<String, dynamic> json) => Topcompanies(
        id: json["_id"],
        companyName: json["companyName"],
        industry: json["industry"],
        location: json["location"],
        email: json["email"],
        bio: json["bio"],
        phone: json["phone"],
        website: json["website"],
        linkedin: json["linkedin"] == null ? null : json["linkedin"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        password: json["password"],
        logoUrl: json["logoUrl"],
        status: json["status"],
        ban: json["ban"],
        linkedIn: json["linkedIn"] == null ? null : json["linkedIn"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        confirmPassword: json["confirmPassword"] == null ? null : json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "industry": industry,
        "location": location,
        "email": email,
        "bio": bio,
        "phone": phone,
        "website": website,
        "linkedin": linkedin == null ? null : linkedin,
        "facebook": facebook,
        "instagram": instagram,
        "password": password,
        "logoUrl": logoUrl,
        "status": status,
        "ban": ban,
        "linkedIn": linkedIn == null ? null : linkedIn,
        "twitter": twitter == null ? null : twitter,
        "confirmPassword": confirmPassword == null ? null : confirmPassword,
    };
}
