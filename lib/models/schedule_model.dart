///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ScheduleModelConsultationTypeSpecialist {
/*
{
  "__typename": "User",
  "id": "4efde437-9ce9-41e8-9ffb-3ab2ae83ed50",
  "fullName": "Oliver Sintim-Aboagye",
  "emailAddress": "spidergeuse@gmail.com",
  "phoneNumber": "+447557771497"
}
*/

  String? Typename;
  String? id;
  String? fullName;
  String? emailAddress;
  String? phoneNumber;

  ScheduleModelConsultationTypeSpecialist({
    this.Typename,
    this.id,
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
  });
  ScheduleModelConsultationTypeSpecialist.fromJson(Map<String, dynamic> json) {
    Typename = json["__typename"]?.toString();
    id = json["id"]?.toString();
    fullName = json["fullName"]?.toString();
    emailAddress = json["emailAddress"]?.toString();
    phoneNumber = json["phoneNumber"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["__typename"] = Typename;
    data["id"] = id;
    data["fullName"] = fullName;
    data["emailAddress"] = emailAddress;
    data["phoneNumber"] = phoneNumber;
    return data;
  }
}

class ScheduleModelConsultationType {
/*
{
  "__typename": "ConsultationType",
  "id": "7e2d3619-fade-4136-887f-86b7ab157a36",
  "specialist": {
    "__typename": "User",
    "id": "4efde437-9ce9-41e8-9ffb-3ab2ae83ed50",
    "fullName": "Oliver Sintim-Aboagye",
    "emailAddress": "spidergeuse@gmail.com",
    "phoneNumber": "+447557771497"
  },
  "types": [
    "CHAT"
  ],
  "availableDate": "2021-09-01T00:00:00.000Z",
  "startTime": "00:00",
  "endTime": "00:30",
  "unAllocatedSlotInMinutes": 30,
  "appointmentId": ""
}
*/

  String? Typename;
  String? id;
  ScheduleModelConsultationTypeSpecialist? specialist;
  List<String?>? types;
  String? availableDate;
  String? startTime;
  String? endTime;
  int? unAllocatedSlotInMinutes;
  String? appointmentId;

  ScheduleModelConsultationType({
    this.Typename,
    this.id,
    this.specialist,
    this.types,
    this.availableDate,
    this.startTime,
    this.endTime,
    this.unAllocatedSlotInMinutes,
    this.appointmentId,
  });
  ScheduleModelConsultationType.fromJson(Map<String, dynamic> json) {
    Typename = json["__typename"]?.toString();
    id = json["id"]?.toString();
    specialist = (json["specialist"] != null) ? ScheduleModelConsultationTypeSpecialist.fromJson(json["specialist"]) : null;
    if (json["types"] != null) {
      final v = json["types"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      types = arr0;
    }
    availableDate = json["availableDate"]?.toString();
    startTime = json["startTime"]?.toString();
    endTime = json["endTime"]?.toString();
    unAllocatedSlotInMinutes = json["unAllocatedSlotInMinutes"]?.toInt();
    appointmentId = json["appointmentId"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["__typename"] = Typename;
    data["id"] = id;
    if (specialist != null) {
      data["specialist"] = specialist!.toJson();
    }
    if (types != null) {
      final v = types;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["types"] = arr0;
    }
    data["availableDate"] = availableDate;
    data["startTime"] = startTime;
    data["endTime"] = endTime;
    data["unAllocatedSlotInMinutes"] = unAllocatedSlotInMinutes;
    data["appointmentId"] = appointmentId;
    return data;
  }
}

class ScheduleModel {
/*
{
  "__typename": "CalendarResult",
  "consultationType": {
    "__typename": "ConsultationType",
    "id": "7e2d3619-fade-4136-887f-86b7ab157a36",
    "specialist": {
      "__typename": "User",
      "id": "4efde437-9ce9-41e8-9ffb-3ab2ae83ed50",
      "fullName": "Oliver Sintim-Aboagye",
      "emailAddress": "spidergeuse@gmail.com",
      "phoneNumber": "+447557771497"
    },
    "types": [
      "CHAT"
    ],
    "availableDate": "2021-09-01T00:00:00.000Z",
    "startTime": "00:00",
    "endTime": "00:30",
    "unAllocatedSlotInMinutes": 30,
    "appointmentId": ""
  },
  "isFree": true
}
*/

  String? Typename;
  ScheduleModelConsultationType? consultationType;
  bool? isFree;

  ScheduleModel({
    this.Typename,
    this.consultationType,
    this.isFree,
  });
  ScheduleModel.fromJson(Map<String, dynamic> json) {
    Typename = json["__typename"]?.toString();
    consultationType = (json["consultationType"] != null) ? ScheduleModelConsultationType.fromJson(json["consultationType"]) : null;
    isFree = json["isFree"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["__typename"] = Typename;
    if (consultationType != null) {
      data["consultationType"] = consultationType!.toJson();
    }
    data["isFree"] = isFree;
    return data;
  }
}
