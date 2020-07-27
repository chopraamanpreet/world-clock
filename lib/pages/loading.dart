import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async{
  
  var url='https://jsonplaceholder.typicode.com/todos/1';
  var response=await http.get(url);

  print(response.body);
  print(response.body.runtimeType);

  Map result=jsonDecode(response.body);
  print(result['title']);
}

@override
  void initState() {
    
    super.initState();
    getData();
    print("Inside Init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}