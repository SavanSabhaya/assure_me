// To parse this JSON data, do
//
//     final deviceListModel = deviceListModelFromJson(jsonString);

import 'dart:convert';

DeviceListModel deviceListModelFromJson(String str) =>
    DeviceListModel.fromJson(json.decode(str));

String deviceListModelToJson(DeviceListModel data) =>
    json.encode(data.toJson());

class DeviceListModel {
  bool? success;
  int? statusCode;
  String? message;
  List<DatumTemp>? data;

  DeviceListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory DeviceListModel.fromJson(Map<String, dynamic> json) =>
      DeviceListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null || json["data"] == []
            ? []
            : List<DatumTemp>.from(
                json["data"]!.map((x) => DatumTemp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumTemp {
  int? id;
  String? userId;
  String? deviceId;
  String? deviceName;
  String? deviceMaxTemperature;
  String? deviceMinTemperature;
  int? deviceAlarm;
  int? autorisedPerson;
  dynamic? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Device? device;

  DatumTemp({
    this.id,
    this.userId,
    this.deviceId,
    this.deviceName,
    this.deviceMaxTemperature,
    this.deviceMinTemperature,
    this.deviceAlarm,
    this.autorisedPerson,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.device,
  });

  factory DatumTemp.fromJson(Map<String, dynamic> json) => DatumTemp(
        id: json["id"],
        userId: json["user_id"],
        deviceId: json["device_id"],
        deviceName: json["device_name"],
        deviceMaxTemperature: json["device_max_Temperature"],
        deviceMinTemperature: json["device_min_Temperature"],
        deviceAlarm: json["device_alarm"],
        autorisedPerson: json["autorised_person"],
        status: json['status'],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "device_id": deviceId,
        "device_name": deviceName,
        "device_max_Temperature": deviceMaxTemperature,
        "device_min_Temperature": deviceMinTemperature,
        "device_alarm": deviceAlarm,
        "autorised_person": autorisedPerson,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "device": device?.toJson(),
      };
}

class Device {
  int? id;
  String? deviceId;
  String? temperature;

  Device({
    this.id,
    this.deviceId,
    this.temperature,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        deviceId: json["device_id"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "device_id": deviceId,
        "temperature": temperature,
      };
}
