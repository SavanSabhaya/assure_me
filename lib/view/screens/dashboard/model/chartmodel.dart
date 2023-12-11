// To parse this JSON data, do
//
//     final chartDataModel = chartDataModelFromJson(jsonString);

import 'dart:convert';

ChartDataModel chartDataModelFromJson(String str) =>
    ChartDataModel.fromJson(json.decode(str));

String chartDataModelToJson(ChartDataModel data) => json.encode(data.toJson());

class ChartDataModel {
  String? message;
  int? startus;
  List<String>? data;

  ChartDataModel({
    this.message,
    this.startus,
    this.data,
  });

  factory ChartDataModel.fromJson(Map<String, dynamic> json) => ChartDataModel(
        message: json["message"],
        startus: json["startus"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "startus": startus,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
