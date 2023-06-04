import 'package:flutter/material.dart';

showSnackBar({context,message,status}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, textAlign: TextAlign.center),
    backgroundColor: status?Colors.green:Colors.red,

  ));
}