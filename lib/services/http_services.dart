import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";

  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};
  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}
/*get*/

  static Future<String ?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  /*post*/
  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.http(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /* put*/
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  /*del*/
  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  /*params*/
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }
  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary.toString(),
      'employee_age': post.employee_age.toString(),
      'profile_image': post.profile_image!,
    });
    return params;
  }
  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'employee_name': post.employee_name!,
      'employee_salary': post.employee_salary.toString(),
      'employee_age': post.employee_age.toString(),
      'profile_image': post.profile_image!,
    });
    return params;
  }








}
