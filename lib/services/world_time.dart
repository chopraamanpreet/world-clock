import 'dart:convert';
import 'package:http/http.dart';

class WorldTime{

  String location;
  String flag;
  String api;
  String time;

  WorldTime({ this.location,this.flag,this.api });

  Future<void>  getTime() async{
  
  var url='http://worldtimeapi.org/api/timezone/$api';
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
  
  
  time=now.toString();
}

}