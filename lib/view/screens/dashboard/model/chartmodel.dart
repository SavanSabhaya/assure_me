// To parse this JSON data, do
//
//     final chartDataModel = chartDataModelFromJson(jsonString);

import 'dart:convert';

ChartDataModel chartDataModelFromJson(String str) => ChartDataModel.fromJson(json.decode(str));

String chartDataModelToJson(ChartDataModel data) => json.encode(data.toJson());

class ChartDataModel {
    String? message;
    int? status;
    List<DateTime>? createdAtList;
    List<String>? temperatureList;

    ChartDataModel({
        this.message,
        this.status,
        this.createdAtList,
        this.temperatureList,
    });

    factory ChartDataModel.fromJson(Map<String, dynamic> json) => ChartDataModel(
        message: json["message"],
        status: json["status"],
        createdAtList: json["created_at_list"] == null ? [] : List<DateTime>.from(json["created_at_list"]!.map((x) => DateTime.parse(x))),
        temperatureList: json["temperature_list"] == null ? [] : List<String>.from(json["temperature_list"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "created_at_list": createdAtList == null ? [] : List<dynamic>.from(createdAtList!.map((x) => x.toIso8601String())),
        "temperature_list": temperatureList == null ? [] : List<dynamic>.from(temperatureList!.map((x) => x)),
    };
}
