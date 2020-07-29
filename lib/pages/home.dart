import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImg = data['isDayTime'] ? 'https://thumbs.dreamstime.com/b/vertical-nature-scene-landscape-countryside-forest-view-blank-sky-daytime-illustration-190084572.jpg':'https://i.pinimg.com/originals/b7/f1/1b/b7f11b9f0a9b9cfb9a2577a8eaa08ab1.jpg';
    Color bgColor=data['isDayTime'] ? Colors.blue : Colors.blue[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bgImg),
              fit: BoxFit.cover,
          )
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  }, 
                  icon: Icon(Icons.edit_location), 
                  label: Text('Edit Location')
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        )
                    )
                  ]
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
                )
              ],
            ),
          ),
        )

      ),
    );
  }
}