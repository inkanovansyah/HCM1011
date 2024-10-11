import 'dart:convert';

class DeleteStoryModel {
  int? status;
  String? error;
  String? message;
  Data? data;

  DeleteStoryModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory DeleteStoryModel.fromRawJson(String str) =>
      DeleteStoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteStoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteStoryModel(
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
  int? isDelete;

  Data({
    this.isDelete,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isDelete: json["is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "is_delete": isDelete,
      };
}
