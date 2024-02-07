class ProfileModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  ProfileModel({this.success, this.statusCode, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? businessId;
  String? logo;
  String? regNo;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? contactPerson;
  String? contactNumber;
  String? address;
  String? role;
  String? status;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;
  List<SubUsers>? subUsers;

  Data(
      {this.id,
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
      this.subUsers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    logo = json['logo'];
    regNo = json['reg_no'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    address = json['address'];
    role = json['role'];
    status = json['status'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['sub_users'] != null) {
      subUsers = <SubUsers>[];
      json['sub_users'].forEach((v) {
        subUsers!.add(new SubUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['logo'] = this.logo;
    data['reg_no'] = this.regNo;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['contact_person'] = this.contactPerson;
    data['contact_number'] = this.contactNumber;
    data['address'] = this.address;
    data['role'] = this.role;
    data['status'] = this.status;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subUsers != null) {
      data['sub_users'] = this.subUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubUsers {
  int? id;
  int? businessId;
  String? logo;
  String? regNo;
  String? name;
  String? username;
  String? email;
  DateTime? emailVerifiedAt;
  String? contactPerson;
  String? contactNumber;
  String? address;
  String? role;
  String? status;
  String? deviceToken;
  dynamic? createdAt;
  dynamic? updatedAt;

  SubUsers(
      {this.id,
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
      this.updatedAt});

  SubUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    logo = json['logo'];
    regNo = json['reg_no'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    contactPerson = json['contact_person'];
    contactNumber = json['contact_number'];
    address = json['address'];
    role = json['role'];
    status = json['status'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['logo'] = this.logo;
    data['reg_no'] = this.regNo;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['contact_person'] = this.contactPerson;
    data['contact_number'] = this.contactNumber;
    data['address'] = this.address;
    data['role'] = this.role;
    data['status'] = this.status;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
