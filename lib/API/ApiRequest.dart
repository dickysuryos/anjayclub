import 'dart:convert';

import 'package:anjayclub/model/Drama.dart';
import 'package:http/http.dart' as http;

class ApiRequest{
  static Future<List<Drama>> shared() async {

    var isLoading = false;
    final response = await http.get("http://anjay.club/anjay.club/api/emp/getallanime.php");
    if (response.statusCode == 200){
     List list = jsonDecode(response.body);
      print("ini response body");
      print(response.body);
      return list.map((data) => new Drama.fromJson(data)).toList();
    }else{
      throw Exception('failed to load data');
    }

  }
}


