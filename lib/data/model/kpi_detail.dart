import 'dart:convert';

class ModelDetailKpi {
  int? status;
  dynamic error;
  String? messages;
  ModelDetailKpiData? data;
  Log? log;

  ModelDetailKpi({
    this.status,
    this.error,
    this.messages,
    this.data,
    this.log,
  });

  ModelDetailKpi copyWith({
    int? status,
    dynamic error,
    String? messages,
    ModelDetailKpiData? data,
    Log? log,
  }) =>
      ModelDetailKpi(
        status: status ?? this.status,
        error: error ?? this.error,
        messages: messages ?? this.messages,
        data: data ?? this.data,
        log: log ?? this.log,
      );

  factory ModelDetailKpi.fromRawJson(String str) =>
      ModelDetailKpi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelDetailKpi.fromJson(Map<String, dynamic> json) => ModelDetailKpi(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null
            ? null
            : ModelDetailKpiData.fromJson(json["data"]),
        log: json["log"] == null ? null : Log.fromJson(json["log"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data?.toJson(),
        "log": log?.toJson(),
      };
}

class ModelDetailKpiData {
  List<Datum>? data;

  ModelDetailKpiData({
    this.data,
  });

  ModelDetailKpiData copyWith({
    List<Datum>? data,
  }) =>
      ModelDetailKpiData(
        data: data ?? this.data,
      );

  factory ModelDetailKpiData.fromRawJson(String str) =>
      ModelDetailKpiData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelDetailKpiData.fromJson(Map<String, dynamic> json) =>
      ModelDetailKpiData(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? sectionId;
  String? companyId;
  String? levelId;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  String? isActive;
  String? isDelete;
  List<Progress>? progress;

  Datum({
    this.id,
    this.sectionId,
    this.companyId,
    this.levelId,
    this.name,
    this.startDate,
    this.endDate,
    this.isActive,
    this.isDelete,
    this.progress,
  });

  Datum copyWith({
    String? id,
    String? sectionId,
    String? companyId,
    String? levelId,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    String? isActive,
    String? isDelete,
    List<Progress>? progress,
  }) =>
      Datum(
        id: id ?? this.id,
        sectionId: sectionId ?? this.sectionId,
        companyId: companyId ?? this.companyId,
        levelId: levelId ?? this.levelId,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isActive: isActive ?? this.isActive,
        isDelete: isDelete ?? this.isDelete,
        progress: progress ?? this.progress,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sectionId: json["section_id"],
        companyId: json["company_id"],
        levelId: json["level_id"],
        name: json["name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        isActive: json["is_active"],
        isDelete: json["is_delete"],
        progress: json["progress"] == null
            ? []
            : List<Progress>.from(
                json["progress"]!.map((x) => Progress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "section_id": sectionId,
        "company_id": companyId,
        "level_id": levelId,
        "name": name,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "is_active": isActive,
        "is_delete": isDelete,
        "progress": progress == null
            ? []
            : List<dynamic>.from(progress!.map((x) => x.toJson())),
      };
}

class Progress {
  String? employee;
  String? position;
  int? progress;
  String? status;
  String? statusDesc;
  String? bgColor;

  Progress({
    this.employee,
    this.position,
    this.progress,
    this.status,
    this.statusDesc,
    this.bgColor,
  });

  Progress copyWith({
    String? employee,
    String? position,
    int? progress,
    String? status,
    String? statusDesc,
    String? bgColor,
  }) =>
      Progress(
        employee: employee ?? this.employee,
        position: position ?? this.position,
        progress: progress ?? this.progress,
        status: status ?? this.status,
        statusDesc: statusDesc ?? this.statusDesc,
        bgColor: bgColor ?? this.bgColor,
      );

  factory Progress.fromRawJson(String str) =>
      Progress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        employee: json["employee"],
        position: json["position"],
        progress: json["progress"],
        status: json["status"],
        statusDesc: json["status_desc"],
        bgColor: json["bg_color"],
      );

  Map<String, dynamic> toJson() => {
        "employee": employee,
        "position": position,
        "progress": progress,
        "status": status,
        "status_desc": statusDesc,
        "bg_color": bgColor,
      };
}

class Log {
  int? status;
  String? msg;
  LogData? data;

  Log({
    this.status,
    this.msg,
    this.data,
  });

  Log copyWith({
    int? status,
    String? msg,
    LogData? data,
  }) =>
      Log(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory Log.fromRawJson(String str) => Log.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : LogData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class LogData {
  String? employeeId;
  String? nik;
  String? fullname;
  String? hp;
  String? gender;
  String? pob;
  String? maritalStatus;
  String? deptId;
  String? departmentName;
  String? gradeId;
  String? companyId;
  String? companyName;
  String? deptName;
  String? positionId;
  String? positionName;
  String? levelId;
  String? levelName;
  dynamic gradeName;
  String? avatar;
  String? email;

  LogData({
    this.employeeId,
    this.nik,
    this.fullname,
    this.hp,
    this.gender,
    this.pob,
    this.maritalStatus,
    this.deptId,
    this.departmentName,
    this.gradeId,
    this.companyId,
    this.companyName,
    this.deptName,
    this.positionId,
    this.positionName,
    this.levelId,
    this.levelName,
    this.gradeName,
    this.avatar,
    this.email,
  });

  LogData copyWith({
    String? employeeId,
    String? nik,
    String? fullname,
    String? hp,
    String? gender,
    String? pob,
    String? maritalStatus,
    String? deptId,
    String? departmentName,
    String? gradeId,
    String? companyId,
    String? companyName,
    String? deptName,
    String? positionId,
    String? positionName,
    String? levelId,
    String? levelName,
    dynamic gradeName,
    String? avatar,
    String? email,
  }) =>
      LogData(
        employeeId: employeeId ?? this.employeeId,
        nik: nik ?? this.nik,
        fullname: fullname ?? this.fullname,
        hp: hp ?? this.hp,
        gender: gender ?? this.gender,
        pob: pob ?? this.pob,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        deptId: deptId ?? this.deptId,
        departmentName: departmentName ?? this.departmentName,
        gradeId: gradeId ?? this.gradeId,
        companyId: companyId ?? this.companyId,
        companyName: companyName ?? this.companyName,
        deptName: deptName ?? this.deptName,
        positionId: positionId ?? this.positionId,
        positionName: positionName ?? this.positionName,
        levelId: levelId ?? this.levelId,
        levelName: levelName ?? this.levelName,
        gradeName: gradeName ?? this.gradeName,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
      );

  factory LogData.fromRawJson(String str) => LogData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogData.fromJson(Map<String, dynamic> json) => LogData(
        employeeId: json["employee_id"],
        nik: json["nik"],
        fullname: json["fullname"],
        hp: json["hp"],
        gender: json["gender"],
        pob: json["pob"],
        maritalStatus: json["marital_status"],
        deptId: json["dept_id"],
        departmentName: json["department_name"],
        gradeId: json["grade_id"],
        companyId: json["company_id"],
        companyName: json["company_name"],
        deptName: json["dept_name"],
        positionId: json["position_id"],
        positionName: json["position_name"],
        levelId: json["level_id"],
        levelName: json["level_name"],
        gradeName: json["grade_name"],
        avatar: json["avatar"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "nik": nik,
        "fullname": fullname,
        "hp": hp,
        "gender": gender,
        "pob": pob,
        "marital_status": maritalStatus,
        "dept_id": deptId,
        "department_name": departmentName,
        "grade_id": gradeId,
        "company_id": companyId,
        "company_name": companyName,
        "dept_name": deptName,
        "position_id": positionId,
        "position_name": positionName,
        "level_id": levelId,
        "level_name": levelName,
        "grade_name": gradeName,
        "avatar": avatar,
        "email": email,
      };
}
