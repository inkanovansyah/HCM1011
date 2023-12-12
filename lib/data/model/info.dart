import 'dart:convert';

class ModelListInfo {
  int status;
  dynamic error;
  String message;
  List<Datum> data;

  ModelListInfo({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory ModelListInfo.fromRawJson(String str) =>
      ModelListInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelListInfo.fromJson(Map<String, dynamic> json) => ModelListInfo(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String author;
  String title;
  String alias;
  String content;
  String summary;
  dynamic categories;
  dynamic linkUrl;
  dynamic media;
  String hits;
  String isActive;
  DateTime createdAt;
  DateTime updateAt;

  Datum({
    required this.id,
    required this.author,
    required this.title,
    required this.alias,
    required this.content,
    required this.summary,
    required this.categories,
    required this.linkUrl,
    required this.media,
    required this.hits,
    required this.isActive,
    required this.createdAt,
    required this.updateAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        alias: json["alias"],
        content: json["content"],
        summary: json["summary"],
        categories: json["categories"],
        linkUrl: json["link_url"],
        media: json["media"],
        hits: json["hits"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "title": title,
        "alias": alias,
        "content": content,
        "summary": summary,
        "categories": categories,
        "link_url": linkUrl,
        "media": media,
        "hits": hits,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
