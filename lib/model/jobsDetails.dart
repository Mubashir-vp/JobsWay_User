// To parse this JSON data, do
//
//     final jobsbyId = jobsbyIdFromJson(jsonString);

import 'dart:convert';

JobsbyId jobsbyIdFromJson(String str) => JobsbyId.fromJson(json.decode(str));

String jobsbyIdToJson(JobsbyId data) => json.encode(data.toJson());

class JobsbyId {
    JobsbyId({
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
        this.companyDetails,
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
    List<CompanyDetail>? companyDetails;

    factory JobsbyId.fromJson(Map<String, dynamic> json) => JobsbyId(
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
        companyDetails: List<CompanyDetail>.from(json["companyDetails"].map((x) => CompanyDetail.fromJson(x))),
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
        "companyDetails": List<dynamic>.from(companyDetails!.map((x) => x.toJson())),
    };
}

class CompanyDetail {
    CompanyDetail({
        this.id,
        this.companyName,
        this.location,
        this.phone,
        this.linkedin,
        this.logoUrl,
    });

    String? id;
    String? companyName;
    String? location;
    String? phone;
    String? linkedin;
    String? logoUrl;

    factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
        id: json["_id"],
        companyName: json["companyName"],
        location: json["location"],
        phone: json["phone"],
        linkedin: json["linkedin"],
        logoUrl: json["logoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "location": location,
        "phone": phone,
        "linkedin": linkedin,
        "logoUrl": logoUrl,
    };
}
