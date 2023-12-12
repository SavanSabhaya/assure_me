class ReportModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Data>? data;

  ReportModel({this.success, this.statusCode, this.message, this.data});

  ReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? deviceId;
  String? temperature;
  int? alarm;
  DateTime? createdAt;
  DateTime? updatedAt;
  Device? device;
  User? user;

  Data(
      {this.id,
      this.deviceId,
      this.temperature,
      this.alarm,
      this.createdAt,
      this.updatedAt,
      this.device,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    temperature = json['temperature'];
    alarm = json['alarm'];
    createdAt =
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]);
    updatedAt =
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]);
    device =
        json['device'] != null ? new Device.fromJson(json['device']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;
    data['temperature'] = this.temperature;
    data['alarm'] = this.alarm;
    data['created_at'] = this.createdAt?.toIso8601String();
    data['updated_at'] = this.updatedAt?.toIso8601String();
    if (this.device != null) {
      data['device'] = this.device!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Device {
  int? id;
  String? deviceId;
  String? deviceName;
  String? userId;

  Device({this.id, this.deviceId, this.deviceName, this.userId});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    deviceName = json['device_name'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;
    data['device_name'] = this.deviceName;
    data['user_id'] = this.userId;
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
