import 'package:meta/meta.dart';
import 'dart:convert';

class SandPicture {
  int status;
  List<dynamic> error;
  String message;
  Data data;

  SandPicture({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory SandPicture.fromRawJson(String str) =>
      SandPicture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SandPicture.fromJson(Map<String, dynamic> json) => SandPicture(
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
  String name;
  String domain;
  String folder;
  Media media;

  Data({
    required this.name,
    required this.domain,
    required this.folder,
    required this.media,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        domain: json["domain"],
        folder: json["folder"],
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "domain": domain,
        "folder": folder,
        "media": media.toJson(),
      };
}

class Media {
  String small;
  String medium;
  String admin;

  Media({
    required this.small,
    required this.medium,
    required this.admin,
  });

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        small: json["small"],
        medium: json["medium"],
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "admin": admin,
      };
}
