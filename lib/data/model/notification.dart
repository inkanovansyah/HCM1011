import 'dart:convert';

class ListNotifikasion {
  int? status;
  dynamic error;
  List<dynamic>? messages;
  ListNotifikasionData? data;

  ListNotifikasion({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ListNotifikasion.fromRawJson(String str) =>
      ListNotifikasion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListNotifikasion.fromJson(Map<String, dynamic> json) =>
      ListNotifikasion(
        status: json["status"],
        error: json["error"],
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null
            ? null
            : ListNotifikasionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
      };
}

class ListNotifikasionData {
  int? status;
  String? msg;
  DataData? data;

  ListNotifikasionData({
    this.status,
    this.msg,
    this.data,
  });

  factory ListNotifikasionData.fromRawJson(String str) =>
      ListNotifikasionData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListNotifikasionData.fromJson(Map<String, dynamic> json) =>
      ListNotifikasionData(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class DataData {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;

  DataData({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory DataData.fromRawJson(String str) =>
      DataData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
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
  String? id;
  String? companyId;
  String? employeeId;
  String? activityDesc;
  String? activityUrl;
  String? activityColor;
  String? isRead;
  dynamic readAt;
  String? isDelete;
  dynamic deletedAt;
  DateTime? createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.companyId,
    this.employeeId,
    this.activityDesc,
    this.activityUrl,
    this.activityColor,
    this.isRead,
    this.readAt,
    this.isDelete,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        companyId: json["company_id"],
        employeeId: json["employee_id"],
        activityDesc: json["activity_desc"],
        activityUrl: json["activity_url"],
        activityColor: json["activity_color"],
        isRead: json["is_read"],
        readAt: json["read_at"],
        isDelete: json["is_delete"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "employee_id": employeeId,
        "activity_desc": activityDesc,
        "activity_url": activityUrl,
        "activity_color": activityColor,
        "is_read": isRead,
        "read_at": readAt,
        "is_delete": isDelete,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
