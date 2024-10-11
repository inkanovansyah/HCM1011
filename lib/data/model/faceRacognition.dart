import 'dart:convert';

class DeleteStoryModel {
  String? msg;
  int? status;
  Data? data;

  DeleteStoryModel({
    this.msg,
    this.status,
    this.data,
  });

  factory DeleteStoryModel.fromRawJson(String str) =>
      DeleteStoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteStoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteStoryModel(
        msg: json["msg"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Images? images;
  Attendance? attendance;

  Data({
    this.images,
    this.attendance,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        attendance: json["attendance"] == null
            ? null
            : Attendance.fromJson(json["attendance"]),
      );

  Map<String, dynamic> toJson() => {
        "images": images?.toJson(),
        "attendance": attendance?.toJson(),
      };
}

class Attendance {
  String? nik;
  DateTime? date;
  String? time;
  Location? location;
  FaceRecognition? faceRecognition;

  Attendance({
    this.nik,
    this.date,
    this.time,
    this.location,
    this.faceRecognition,
  });

  factory Attendance.fromRawJson(String str) =>
      Attendance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        nik: json["nik"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        faceRecognition: json["face-recognition"] == null
            ? null
            : FaceRecognition.fromJson(json["face-recognition"]),
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "location": location?.toJson(),
        "face-recognition": faceRecognition?.toJson(),
      };
}

class FaceRecognition {
  int? status;
  String? msg;

  FaceRecognition({
    this.status,
    this.msg,
  });

  factory FaceRecognition.fromRawJson(String str) =>
      FaceRecognition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FaceRecognition.fromJson(Map<String, dynamic> json) =>
      FaceRecognition(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}

class Location {
  int? lat;
  int? long;
  String? place;

  Location({
    this.lat,
    this.long,
    this.place,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        long: json["long"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
        "place": place,
      };
}

class Images {
  Original? original;

  Images({
    this.original,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
