import 'dart:convert';

class ModelUploadFoto {
  int? status;
  bool? error;
  String? message;
  Data? data;

  ModelUploadFoto({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ModelUploadFoto.fromRawJson(String str) =>
      ModelUploadFoto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelUploadFoto.fromJson(Map<String, dynamic> json) =>
      ModelUploadFoto(
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
  Image? image;

  Data({
    this.image,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
      };
}

class Image {
  Original? original;

  Image({
    this.original,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original?.toJson(),
      };
}

class Original {
  String? file;
  String? mimeType;
  String? sourceUrl;

  Original({
    this.file,
    this.mimeType,
    this.sourceUrl,
  });

  factory Original.fromRawJson(String str) =>
      Original.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        file: json["file"],
        mimeType: json["mime_type"],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "mime_type": mimeType,
        "source_url": sourceUrl,
      };
}
