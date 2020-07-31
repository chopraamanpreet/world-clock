import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
   List<WorldTime> locations = [
    WorldTime(api: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(api: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(api: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(api: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(api: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(api: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(api: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(api: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void getLocation(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();

    //print(instance.time);
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[50],
      appBar: AppBar(
        title:Text('Choose Location'),
        elevation: 0,
        ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: ListTile(
                  onTap: (){
                    getLocation(index);
                  },
                  leading: CircleAvatar(
                    backgroundImage:AssetImage('assets/${locations[index].flag}'),
                  ),
                  title: Text(locations[index].location),
                ),
            ),
          );
        }
        )
    );
  }
}