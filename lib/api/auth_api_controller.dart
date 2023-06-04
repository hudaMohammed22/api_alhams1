import 'dart:convert';

import 'package:api_alhams/model/ApiResponse.dart';
import 'package:api_alhams/model/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApi {

  Future<ApiResponse?> login({email,password}) async {
    Uri url = Uri.parse("http://demo-api.mr-dev.tech/api/students/auth/login");
    http.Response response = await http.post(url,body: {
      "email":email,
      "password":password
    });

    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      ApiResponse<User> apiResponse =  ApiResponse<User>.fromJson(jsonResponse);
        if(response.statusCode == 200){
          if(apiResponse.object != null){
            GetStorage().write("token", apiResponse.object!.token);
            GetStorage().write("id", apiResponse.object!.id);
            GetStorage().write("email", apiResponse.object!.email);
          }
        }
        return apiResponse;

    }else {
      return ApiResponse(status: false,message: "something wrong");
    }
  }

  Future<ApiResponse?> register({required User user}) async {
    Uri url = Uri.parse("http://demo-api.mr-dev.tech/api/students/auth/register");
    http.Response response = await http.post(url,body:user.toJson1());

    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = json.decode(response.body);
      return ApiResponse.fromJson(jsonResponse);
    }else {
      return ApiResponse(status: false,message: "something wrong");
    }
  }

  Future<ApiResponse?> forgetPassword({email}) async {
    Uri url = Uri.parse("http://demo-api.mr-dev.tech/api/students/auth/forget-password");
    http.Response response = await http.post(url,body: {
      "email":email,
    });

    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      ApiResponse apiResponse =  ApiResponse.fromJson(jsonResponse);

      return apiResponse;

    }else {
      return ApiResponse(status: false,message: "something wrong");
    }
  }

  Future<ApiResponse?> resetPassword({email,password,password_confirmation,code}) async {
    Uri url = Uri.parse("http://demo-api.mr-dev.tech/api/students/auth/reset-password");
    http.Response response = await http.post(url,body: {
      "email":email,
      "code":code,
      "password":password,
      "password_confirmation":password_confirmation,

    });

    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);

      return ApiResponse.fromJson(jsonResponse);

    }else {
      return ApiResponse(status: false,message: "something wrong");
    }
  }
}