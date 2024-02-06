// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ProfileModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  int? businessId;
  String? logo;
  String? regNo;
  String? name;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? contactPerson;
  String? contactNumber;
  String? address;
  String? role;
  String? status;
  String? deviceToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Data>? subuser;

  Data({
    this.id,
    this.businessId,
    this.logo,
    this.regNo,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.contactPerson,
    this.contactNumber,
    this.address,
    this.role,
    this.status,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.subuser,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    businessId: json["business_id"],
    logo: json["logo"],
    regNo: json["reg_no"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    contactPerson: json["contact_person"],
    contactNumber: json["contact_number"],
    address: json["address"],
    role: json["role"],
    status: json["status"],
    deviceToken: json["device_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    subuser: json["subuser"] == null ? [] : List<Data>.from(json["subuser"]!.map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "logo": logo,
    "reg_no": regNo,
    "name": name,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "contact_person": contactPerson,
    "contact_number": contactNumber,
    "address": address,
    "role": role,
    "status": status,
    "device_token": deviceToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "subuser": subuser == null ? [] : List<dynamic>.from(subuser!.map((x) => x.toJson())),
  };
}
