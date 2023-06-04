import 'package:api_alhams/model/Post.dart';
import 'package:api_alhams/api/api_controller.dart';
import 'package:flutter/material.dart';

import 'my_images.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyImages()));
          }, icon: Icon(Icons.image))
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: ApiController().getAllPosts(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.data!.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    snapshot.data![index].id;
                  },
                  title: Text(snapshot.data![index].title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  subtitle: Text(snapshot.data![index].body!),
                );
              },
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else {
            return Center(child: Text("no data found"),);
          }

        },
      ),
    );
  }
}
