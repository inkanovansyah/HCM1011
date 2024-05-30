import 'dart:convert';

class ListStoryn {
  int? status;
  String? error;
  String? message;
  List<Datums>? data;

  ListStoryn({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ListStoryn.fromRawJson(String str) =>
      ListStoryn.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListStoryn.fromJson(Map<String, dynamic> json) => ListStoryn(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datums>.from(json["data"]!.map((x) => Datums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datums {
  String? storyId;
  String? nameFile;
  String? source;
  String? createBy;
  String? createAt;

  Datums({
    this.storyId,
    this.nameFile,
    this.source,
    this.createBy,
    this.createAt,
  });

  factory Datums.fromRawJson(String str) => Datums.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
        storyId: json["story_id"],
        nameFile: json["name_file"],
        source: json["source"],
        createBy: json["create_by"],
        createAt: json["create_at"],
      );

  Map<String, dynamic> toJson() => {
        "story_id": storyId,
        "name_file": nameFile,
        "source": source,
        "create_by": createBy,
        "create_at": createAt,
      };
}
