// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Temperatures temperaturesFromJson(String str) =>
    Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
  final int status;
  final List<dynamic> error;
  final String message;
  final Data data;

  Temperatures({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        status: json["status"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": List<dynamic>.from(error.map((x) => x)),
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final int total;
  final int totalFilter;
  final List<Map<String, String>> list;

  Data({
    required this.total,
    required this.totalFilter,
    required this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        totalFilter: json["totalFilter"],
        list: List<Map<String, String>>.from(json["list"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalFilter": totalFilter,
        "list": List<dynamic>.from(list.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
