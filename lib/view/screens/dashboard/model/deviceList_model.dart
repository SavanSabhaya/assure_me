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
        data: json["data"] == null
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
  String? deviceMaxTemperature;
  String? deviceMinTemperature;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumTemp({
    this.id,
    this.userId,
    this.deviceId,
    this.deviceMaxTemperature,
    this.deviceMinTemperature,
    this.createdAt,
    this.updatedAt,
  });

  factory DatumTemp.fromJson(Map<String, dynamic> json) => DatumTemp(
        id: json["id"],
        userId: json["user_id"],
        deviceId: json["device_id"],
        deviceMaxTemperature: json["device_max_Temperature"],
        deviceMinTemperature: json["device_min_Temperature"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "device_id": deviceId,
        "device_max_Temperature": deviceMaxTemperature,
        "device_min_Temperature": deviceMinTemperature,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
