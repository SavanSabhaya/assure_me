// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Datum>? data;

  ReportModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  int? id;
  String? deviceId;
  String? temperature;
  int? alarm;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.deviceId,
    this.temperature,
    this.alarm,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        deviceId: json["device_id"],
        temperature: json["temperature"],
        alarm: json["alarm"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "device_id": deviceId,
        "temperature": temperature,
        "alarm": alarm,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
