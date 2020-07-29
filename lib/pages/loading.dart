

import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  String time='Loading...';

  void getWorldTime() async {
    WorldTime instance=WorldTime(location: 'India',flag: 'india.png',api: 'Asia/Kolkata');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time
    });
  }

@override
  void initState() {
    
    super.initState();
    getWorldTime();
    print("Inside Init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text("Loading")
      ),
    );
  }
}