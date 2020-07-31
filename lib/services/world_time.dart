import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String flag;
  String api;
  String time;
  bool isDayTime;

  WorldTime({ this.location,this.flag,this.api });

  Future<void>  getTime() async{
  

  try{

        var url='http://worldtimeapi.org/api/timezone/$api';
        Response response=await get(url);

        Map result=jsonDecode(response.body);
        String datetime=result['datetime'];
        
        
        String offseth=result['utc_offset'].substring(1,3);

    


        print(datetime);
        print(offseth);
        

        //print(result);

        DateTime now= DateTime.parse(datetime);
        now=now.add(Duration(hours:int.parse(offseth)));
        isDayTime= now.hour>6 && now.hour <20  ? true : false;
        print('now $now $isDayTime');
        print('Current Time $now');
        
        time=DateFormat.jm().format(now);
        //time=now.toString();
  }

  catch(e){
    print(e);
    time='could not get time';
  }
  
}

}