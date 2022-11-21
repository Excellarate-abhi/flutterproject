import 'package:flutternewproject/model/planner.dart';

import '../base/api_base.dart';

class MyDayRepo {

  final String _apiKey = "/plannerlist";
  final ApiBase _apiBase = ApiBase();

  Future<Planner_model> planner(String? userId) async {
    final response = await _apiBase
        .getMyDayData(_apiKey,userId);
    return Planner_model.fromJson(response);
  }
}
