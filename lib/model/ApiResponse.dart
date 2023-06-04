import 'package:api_alhams/model/image_class.dart';
import 'package:api_alhams/model/user.dart';

class ApiResponse<T> {
  bool? status;
  String? message;
  T? object;
  int? code;
  ApiResponse({this.status, this.message, this.object});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if(T is! User){
      object =  json['object'] != null ? ImageClass.fromJson(json['object']) as T : null;
    }else {
      object =  json['object'] != null ? User.fromJson(json['object']) as T : null;
    }
    code =  json['code'];
  }


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   // if (this.object != null) {
  //   //   data['object'] = this.object!.toJson();
  //   // }
  //   return data;
  // }
}

