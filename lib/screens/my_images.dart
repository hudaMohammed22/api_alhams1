import 'package:api_alhams/model/image_class.dart';
import 'package:flutter/material.dart';

import '../api/images_controller.dart';
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
      body:FutureBuilder<List<ImageClass>>(
        future: ImageApiController().getAllStudentImages(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.data!.isNotEmpty){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Image.network(snapshot.data![index].imageUrl!);
              },
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else {
            return Center(child: Text("no data found"),);
          }

        },
      ) ,
    );
  }
}
