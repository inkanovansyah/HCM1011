import 'dart:convert';

class SubmitSelfGoalSetting {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  SubmitSelfGoalSetting({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory SubmitSelfGoalSetting.fromRawJson(String str) =>
      SubmitSelfGoalSetting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubmitSelfGoalSetting.fromJson(Map<String, dynamic> json) =>
      SubmitSelfGoalSetting(
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
  Section? section;
  Answer? answer;
  Summary? summary;

  Data({
    this.section,
    this.answer,
    this.summary,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        section:
            json["section"] == null ? null : Section.fromJson(json["section"]),
        answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
        summary:
            json["summary"] == null ? null : Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "section": section?.toJson(),
        "answer": answer?.toJson(),
        "summary": summary?.toJson(),
      };
}

class Answer {
  int? status;
  String? msg;
  List<dynamic>? data;

  Answer({
    this.status,
    this.msg,
    this.data,
  });

  factory Answer.fromRawJson(String str) => Answer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}

class Section {
  String? id;
  String? code;
  String? sortNumber;
  String? alias;
  String? kpiDesc;
  String? kpiSubDesc;
  String? overallDesc;
  String? bobot;
  String? sectionFormat;
  String? sectionForm;
  String? status;
  String? statusEntry;
  String? factor;
  DateTime? createdAt;
  dynamic updatedAt;

  Section({
    this.id,
    this.code,
    this.sortNumber,
    this.alias,
    this.kpiDesc,
    this.kpiSubDesc,
    this.overallDesc,
    this.bobot,
    this.sectionFormat,
    this.sectionForm,
    this.status,
    this.statusEntry,
    this.factor,
    this.createdAt,
    this.updatedAt,
  });

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        code: json["code"],
        sortNumber: json["sort_number"],
        alias: json["alias"],
        kpiDesc: json["kpi_desc"],
        kpiSubDesc: json["kpi_sub_desc"],
        overallDesc: json["overall_desc"],
        bobot: json["bobot"],
        sectionFormat: json["section_format"],
        sectionForm: json["section_form"],
        status: json["status"],
        statusEntry: json["status_entry"],
        factor: json["factor"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "sort_number": sortNumber,
        "alias": alias,
        "kpi_desc": kpiDesc,
        "kpi_sub_desc": kpiSubDesc,
        "overall_desc": overallDesc,
        "bobot": bobot,
        "section_format": sectionFormat,
        "section_form": sectionForm,
        "status": status,
        "status_entry": statusEntry,
        "factor": factor,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}

class Summary {
  int? status;
  String? msg;

  Summary({
    this.status,
    this.msg,
  });

  factory Summary.fromRawJson(String str) => Summary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
