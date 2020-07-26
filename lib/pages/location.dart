import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
void getData() async{
  String username = await Future.delayed(Duration(seconds: 2),(){
    return "Done!";
  });
  await Future.delayed(Duration(seconds: 3),(){
    print(username);
  });

  print("Outside Future");
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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title:Text('Loading Screen'),
        elevation: 0,
        ),
      body: Text('Loading'),
    );
  }
}