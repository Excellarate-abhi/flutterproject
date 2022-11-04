class register {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobileNo;
  bool? isEnabled;

  register(
      {this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.mobileNo,
        this.isEnabled});

  register.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    mobileNo = json['mobileNo'];
    isEnabled = json['isEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobileNo'] = this.mobileNo;
    data['isEnabled'] = this.isEnabled;
    return data;
  }
}