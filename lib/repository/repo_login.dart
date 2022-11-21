import 'dart:convert';

import 'package:flutternewproject/model/login.dart';

import '../base/api_base.dart';

class AuthRepo {
  final String _apiKey = "/login";
  final ApiBase _apiBase = ApiBase();

  Future<login> loginrepo(String? email, String? password) async {
    final response = await _apiBase
        .postLogin(_apiKey, {"email": email, "password": password});
    return login.fromJson(response);

  }
}
