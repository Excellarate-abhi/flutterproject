class login {
  int? status;
  Data? data;

  login({this.status, this.data});

  login.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? email;
  String? lastName;
  bool? isEnabled;
  String? id;
  String? mobileNo;

  Data(
      {this.firstName,
        this.email,
        this.lastName,
        this.isEnabled,
        this.id,
        this.mobileNo});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    email = json['email'];
    lastName = json['lastName'];
    isEnabled = json['isEnabled'];
    id = json['id'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['lastName'] = this.lastName;
    data['isEnabled'] = this.isEnabled;
    data['id'] = this.id;
    data['mobileNo'] = this.mobileNo;
    return data;
  }
}