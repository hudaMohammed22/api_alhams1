import 'dart:io';

import 'package:api_alhams/model/image_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api/images_controller.dart';
import '../get/api_getx_controller.dart';
import '../model/ApiResponse.dart';

class AddImage extends StatefulWidget {
  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final ImagePicker picker = ImagePicker();
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          file != null
              ? Image.file(
                  File(file!.path),
                  height: 200,
                  width: 200,
                )
              : Image.network(
                  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQRjpXafixOvxEcaKVUzAu7g_cVhcG0ZSV689A1QfpAAQRrMR7A",height: 150,width: 150),
          ElevatedButton(
              onPressed: ()  async{
                file = await picker.pickImage(source: ImageSource.gallery);
                setState(()  {
                });
              },
              child: Text("selectImage")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                ApiResponse<ImageClass> response = await ImageApiController().uploadImage(path: file!.path,context: context);
                if(response.status!){
                  Navigator.pop(context);
                  Get.find<ApiGextController>().addToList(response.object);

                }
              },
              child: Text("uploadImage")),
        ],
      ),
    );
  }
}
