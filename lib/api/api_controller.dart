import 'dart:convert';
import 'dart:io';

import 'package:api_alhams/model/Post.dart';
import 'package:http/http.dart' as http;

class ApiController {

  Future<List<Post>> getAllPosts() async {
    List<Post> list = [];
    //url
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    //method
    http.Response response = await http.get(uri);

    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body.forEach((e) {
        list.add(Post.fromJson(e));
      });
    }
    return list;
  }

  Future<Post?> getOnePosts({id}) async {
    //url
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    //method
    http.Response response = await http.get(uri);

    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return Post.fromJson(body);
    }
    return null;
  }

  Future<List<Post>> getUserPosts({userId}) async {
    var map = {
      "userId": userId
    };
    List<Post> list = [];
    //url
    Uri uri = Uri.https("jsonplaceholder.typicode.com", "posts", map);
    // Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=$userId");
    //method
    http.Response response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body.forEach((e) {
        list.add(Post.fromJson(e));
      });
    }
    return list;
  }

  Future<Post?> addPost({required Post post}) async {
    // var map = {
    //   "title": post.title,
    //   "body": post.body,
    //   "userId": post.userId,
    // };
    //url
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    //method
    http.Response response = await http.post(uri,
        body: post.toJson(),
        headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    });

    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return Post.fromJson(body);
    }
    return null;
  }
}