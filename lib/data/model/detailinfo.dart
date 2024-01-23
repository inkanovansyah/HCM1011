import 'dart:convert';

class ModelDetailtInfo {
  int status;
  bool error;
  Message message;
  Data data;

  ModelDetailtInfo({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory ModelDetailtInfo.fromRawJson(String str) =>
      ModelDetailtInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelDetailtInfo.fromJson(Map<String, dynamic> json) =>
      ModelDetailtInfo(
        status: json["status"],
        error: json["error"],
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String author;
  String title;
  String alias;
  String content;
  String summary;
  dynamic categories;
  dynamic linkUrl;
  String file;
  String hits;
  String isActive;
  DateTime createdAt;
  DateTime updateAt;

  Data({
    required this.id,
    required this.author,
    required this.title,
    required this.alias,
    required this.content,
    required this.summary,
    required this.categories,
    required this.linkUrl,
    required this.file,
    required this.hits,
    required this.isActive,
    required this.createdAt,
    required this.updateAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        alias: json["alias"],
        content: json["content"],
        summary: json["summary"],
        categories: json["categories"],
        linkUrl: json["link_url"],
        file: json["file"],
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
        "file": file,
        "hits": hits,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}

class Message {
  String sukses;

  Message({
    required this.sukses,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        sukses: json["sukses"],
      );

  Map<String, dynamic> toJson() => {
        "sukses": sukses,
      };
}
