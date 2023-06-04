import 'dart:convert';
import 'dart:io';

import 'package:api_alhams/model/ApiResponse.dart';
import 'package:api_alhams/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/image_class.dart';

class ImageApiController {
  Future<List<ImageClass>> getAllStudentImages(context) async {
    List<ImageClass> list = [];
    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/student/images");
    //method
    http.Response response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer " + GetStorage().read("token")
    });

    print(response.body);
    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body['data'].forEach((e) {
        list.add(ImageClass.fromJson(e));
      });
    } else if (response.statusCode == 401) {
      GetStorage().erase();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
    return list;
  }


  uploadImage({path,context}) async {
    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/student/images");

    http.MultipartRequest request = http.MultipartRequest('POST',uri);

    http.MultipartFile file = await http.MultipartFile.fromPath("image", path);
    request.files.add(file);
    request.headers[HttpHeaders.authorizationHeader] = "Bearer "+GetStorage().read("token");
    // request.fields['name'] = name;

    http.StreamedResponse response = await request.send();

    if(response.statusCode == 201 || response.statusCode == 400){
      var body =  await response.stream.transform(utf8.decoder).first;
      ApiResponse<ImageClass> jsonResponse = ApiResponse<ImageClass>.fromJson(json.decode(body));
      // if(response.statusCode == 201){
      //
      // }
      return jsonResponse;
    }if(response.statusCode == 401){
      GetStorage().erase();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
    }
  }
}
