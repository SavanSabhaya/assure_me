// To parse this JSON data, do
//
//     final offlineNotification = offlineNotificationFromJson(jsonString);

import 'dart:convert';

OfflineNotification offlineNotificationFromJson(String str) => OfflineNotification.fromJson(json.decode(str));

String offlineNotificationToJson(OfflineNotification data) => json.encode(data.toJson());

class OfflineNotification {
    bool? success;
    int? statusCode;
    String? message;
    Data? data;

    OfflineNotification({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    factory OfflineNotification.fromJson(Map<String, dynamic> json) => OfflineNotification(
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
    int? senderId;
    int? receiverId;
    String? packageId;
    String? title;
    String? message;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.senderId,
        this.receiverId,
        this.packageId,
        this.title,
        this.message,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        packageId: json["package_id"],
        title: json["title"],
        message: json["message"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "package_id": packageId,
        "title": title,
        "message": message,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
