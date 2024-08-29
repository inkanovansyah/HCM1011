import 'dart:convert';

class Schadule {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  Schadule({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory Schadule.fromRawJson(String str) =>
      Schadule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schadule.fromJson(Map<String, dynamic> json) => Schadule(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data?.toJson(),
      };
}

class Data {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;

  Data({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        perPage: json["perPage"],
        total: json["total"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "total": total,
        "totalPages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? trainingScheduleId;
  String? categoryId;
  String? vendorId;
  String? trainerId;
  String? trainingName;
  String? categoryName;
  String? vendorName;
  String? trainerName;
  DateTime? startDate;
  DateTime? endDate;
  String? location;
  String? points;
  String? level;
  String? description;
  dynamic images;

  Datum({
    this.trainingScheduleId,
    this.categoryId,
    this.vendorId,
    this.trainerId,
    this.trainingName,
    this.categoryName,
    this.vendorName,
    this.trainerName,
    this.startDate,
    this.endDate,
    this.location,
    this.points,
    this.level,
    this.description,
    this.images,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainingScheduleId: json["training_schedule_id"],
        categoryId: json["category_id"],
        vendorId: json["vendor_id"],
        trainerId: json["trainer_id"],
        trainingName: json["training_name"],
        categoryName: json["category_name"],
        vendorName: json["vendor_name"],
        trainerName: json["trainer_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        location: json["location"],
        points: json["points"],
        level: json["level"],
        description: json["description"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "training_schedule_id": trainingScheduleId,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "trainer_id": trainerId,
        "training_name": trainingName,
        "category_name": categoryName,
        "vendor_name": vendorName,
        "trainer_name": trainerName,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "location": location,
        "points": points,
        "level": level,
        "description": description,
        "images": images,
      };
}
