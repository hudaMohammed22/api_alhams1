import 'package:api_alhams/model/image_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/images_controller.dart';
import '../get/api_getx_controller.dart';
import 'AddImage.dart';

class MyImages extends StatefulWidget {

  @override
  State<MyImages> createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddImage()));
          }, icon: Icon(Icons.add))
        ],
      ),
      // body: Obx(() {
      //       return GridView.builder(
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 10,
      //             crossAxisSpacing: 10
      //         ),
      //         itemCount: Get.find().list.length,
      //         itemBuilder: (context, index) {
      //           return Image.network(Get.find().list[index].imageUrl!);
      //         },
      //       );
      //     }
      // ),
      //GetX
      body: GetX<ApiGextController>(
        init: ApiGextController(),
          builder: (controller) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
              ),
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Image.network(controller.list[index].imageUrl!);
              },
            );
          }
      ),


      //GetBuilder
      // body: GetBuilder<ApiGextController>(
      //   builder: (controller) {
      //     return GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10
      //       ),
      //       itemCount: controller.list.length,
      //       itemBuilder: (context, index) {
      //         return Image.network(controller.list[index].imageUrl!);
      //       },
      //     );
      //   }
      // ),
    );
  }
}
