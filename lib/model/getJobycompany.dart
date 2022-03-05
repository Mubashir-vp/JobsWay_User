// To parse this JSON data, do
//
//     final jobnycompanies = jobnycompaniesFromJson(jsonString);

import 'dart:convert';

List<Jobnycompanies> jobnycompaniesFromJson(String str) => List<Jobnycompanies>.from(json.decode(str).map((x) => Jobnycompanies.fromJson(x)));

String jobnycompaniesToJson(List<Jobnycompanies> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jobnycompanies {
    Jobnycompanies({
        this.id,
        this.jobTitle,
        this.jobCategory,
        this.minExp,
        this.maxExp,
        this.timeSchedule,
        this.minSalary,
        this.maxSalary,
        this.qualification,
        this.education,
        this.jobLocation,
        this.skills,
        this.language,
        this.status,
        this.companyId,
        this.hrId,
        this.createdDate,
        this.applications,
        this.payPlan,
    });

    String? id;
    String? jobTitle;
    String? jobCategory;
    String? minExp;
    String? maxExp;
    String? timeSchedule;
    String? minSalary;
    String? maxSalary;
    List<String>? qualification;
    List<String>? education;
    String? jobLocation;
    List<String>? skills;
    List<String>? language;
    bool? status;
    String? companyId;
    String? hrId;
    DateTime? createdDate;
    List<dynamic>? applications;
    String? payPlan;

    factory Jobnycompanies.fromJson(Map<String, dynamic> json) => Jobnycompanies(
        id: json["_id"],
        jobTitle: json["jobTitle"],
        jobCategory: json["jobCategory"],
        minExp: json["minExp"],
        maxExp: json["maxExp"],
        timeSchedule: json["timeSchedule"],
        minSalary: json["minSalary"],
        maxSalary: json["maxSalary"],
        qualification: List<String>.from(json["qualification"].map((x) => x)),
        education: List<String>.from(json["education"].map((x) => x)),
        jobLocation: json["jobLocation"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        language: List<String>.from(json["language"].map((x) => x)),
        status: json["status"],
        companyId: json["companyId"],
        hrId: json["hrId"],
        createdDate: DateTime.parse(json["createdDate"]),
        applications: List<dynamic>.from(json["applications"].map((x) => x)),
        payPlan: json["payPlan"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "jobTitle": jobTitle,
        "jobCategory": jobCategory,
        "minExp": minExp,
        "maxExp": maxExp,
        "timeSchedule": timeSchedule,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "qualification": List<dynamic>.from(qualification!.map((x) => x)),
        "education": List<dynamic>.from(education!.map((x) => x)),
        "jobLocation": jobLocation,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "language": List<dynamic>.from(language!.map((x) => x)),
        "status": status,
        "companyId": companyId,
        "hrId": hrId,
        "createdDate": createdDate!.toIso8601String(),
        "applications": List<dynamic>.from(applications!.map((x) => x)),
        "payPlan": payPlan,
    };
}
