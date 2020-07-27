import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async{
  
  var url='http://worldtimeapi.org/api/timezone/Asia/Kolkata';
  Response response=await get(url);

  Map result=jsonDecode(response.body);
  String datetime=result['datetime'];
  String offset=result['utc_offset'].substring(1,3);

  print(datetime);
  print(offset);

  //print(result);

  DateTime now= DateTime.parse(datetime);
  print('now $now');
  now=now.add(Duration(hours:int.parse(offset)));
  print('Current Time $now');
}

@override
  void initState() {
    
    super.initState();
    getTime();
    print("Inside Init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}