import 'package:assessment_by_maimunah_ibrahim/models/user_model.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ApiService {
  Future<List<UserData>> getData() async {
    var file = await DefaultCacheManager().getSingleFile(
        "https://dummyapi.io/data/api/user?limit=100",
        headers: {"app-id": "600872c839bbc7a21c39b3df"});
    if (file != null && await file.exists()) {
      var res = await file.readAsString();
      return userFromJson(res).data;
    }
    return null;
  }
}

ApiService apiService = ApiService();
