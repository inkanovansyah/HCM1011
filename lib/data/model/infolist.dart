import 'dart:convert';

class ModelList {
  int? status;
  dynamic error;
  String? message;
  List<Datum>? data;

  ModelList({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ModelList.fromRawJson(String str) =>
      ModelList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelList.fromJson(Map<String, dynamic> json) => ModelList(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  String? id;
  String? author;
  String? title;
  String? alias;
  String? content;
  String? summary;
  dynamic categories;
  dynamic linkUrl;
  dynamic media;
  String? hits;
  String? isActive;
  DateTime? createdAt;
  DateTime? updateAt;

  Datum({
    this.id,
    this.author,
    this.title,
    this.alias,
    this.content,
    this.summary,
    this.categories,
    this.linkUrl,
    this.media,
    this.hits,
    this.isActive,
    this.createdAt,
    this.updateAt,
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
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
        "created_at": createdAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}
