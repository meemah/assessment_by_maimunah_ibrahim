import 'package:assessment_by_maimunah_ibrahim/views/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'dart:convert';

// import 'package:http/http.dart';

class ApiService {
  // Future<Response> getData(String url, Map<String, String> headers) async {
  //   var file = await DefaultCacheManager().getSingleFile(url, headers: headers);
  //   if (file != null && await file.exists()) {
  //     var res = await file.readAsString();
  //     return Response(res, 200);
  //   }
  //   return Response(null, 404);
  // }
  Future<List<UserData>> getData() async {
    var file = await DefaultCacheManager().getSingleFile(
        "https://dummyapi.io/data/api/user?limit=100",
        headers: {"app-id": "600872c839bbc7a21c39b3df"});
    if (file != null && await file.exists()) {
      var res = await file.readAsString();
      return userFromJson(res).data;
    }
    return null;
    //   final response = await http.get(
    //       "https://dummyapi.io/data/api/user?limit=100",
    //       headers: {"app-id": "600872c839bbc7a21c39b3df"});
    //   if (response.statusCode == 200) {
    //     print(response.body);

    //     // return  jsonDecode(response.body)["data"];
    //     // return response.body;
    //     //  userFromJson(jsonDecode(response.body)["data"]);
    //     //  response.body["data"]
    //     return userFromJson(response.body).data;
    //   } else {
    //     throw ("Exception occured");
    //   }
  }
}

ApiService apiService = ApiService();
