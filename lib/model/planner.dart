class Planner_model {
  int? status;
  Data? data;

  Planner_model({this.status, this.data});

  Planner_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PlannerList>? plannerList;

  Data({this.plannerList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plannerList'] != null) {
      plannerList = <PlannerList>[];
      json['plannerList'].forEach((v) {
        plannerList!.add(new PlannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plannerList != null) {
      data['plannerList'] = this.plannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlannerList {
  String? status;
  String? id;
  String? startDateTime;
  bool? isSnoozed;
  String? title;
  String? userid;
  bool? isSilenced;
  String? location;
  bool? isRequired;
  bool? isPriority;
  String? endDateTime;
  String? type;

  PlannerList(
      {this.status,
        this.id,
        this.startDateTime,
        this.isSnoozed,
        this.title,
        this.userid,
        this.isSilenced,
        this.location,
        this.isRequired,
        this.isPriority,
        this.endDateTime,
        this.type});

  PlannerList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    startDateTime = json['startDateTime'];
    isSnoozed = json['isSnoozed'];
    title = json['title'];
    userid = json['userid'];
    isSilenced = json['isSilenced'];
    location = json['location'];
    isRequired = json['isRequired'];
    isPriority = json['isPriority'];
    endDateTime = json['endDateTime'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['startDateTime'] = this.startDateTime;
    data['isSnoozed'] = this.isSnoozed;
    data['title'] = this.title;
    data['userid'] = this.userid;
    data['isSilenced'] = this.isSilenced;
    data['location'] = this.location;
    data['isRequired'] = this.isRequired;
    data['isPriority'] = this.isPriority;
    data['endDateTime'] = this.endDateTime;
    data['type'] = this.type;
    return data;
  }
}