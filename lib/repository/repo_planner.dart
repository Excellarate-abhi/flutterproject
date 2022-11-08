import '../base/api_base.dart';

class PlannerRepo {
  final String _apiKey = "/plannerlist";
  final ApiBase _apiBase = ApiBase();

  Future<dynamic> planner(String? userId) async {
    final response = await _apiBase
        .getPlannerData(_apiKey);
    return response;
  }
}
