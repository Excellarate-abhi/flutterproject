import '../base/api_base.dart';

class RegisterRepo {
  final String _apiKey = "/register";
  final ApiBase _apiBase = ApiBase();

  Future<dynamic> register(String? firstName, String? lastName, String? email,
      String? password, String? mobileNo, String? isEnabled) async {
    final response = await _apiBase.postRegister(_apiKey, {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "mobileNo": mobileNo,
      "isEnabled": isEnabled
    });
    return response;
  }
}
