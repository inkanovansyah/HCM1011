import 'dart:convert';

class AppCar {
  final int? status;
  final String? error;
  final String? message;
  final Data? data;

  AppCar({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory AppCar.fromRawJson(String str) => AppCar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppCar.fromJson(Map<String, dynamic> json) => AppCar(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? isActive;

  Data({
    this.isActive,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
      };
}
