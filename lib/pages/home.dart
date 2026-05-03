import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String Bgimage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.lightBlue! : Colors.indigo[700]!;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/$Bgimage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                      'flag' : result['flag']
                    };
                  });
                },
                  icon: Icon(
                    Icons.location_pin,
                    color: Colors.indigo),
                    label: Text('edit location',style: TextStyle(color: Colors.indigo),),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],style: TextStyle(color: Colors.white,fontSize: 20, letterSpacing: 2.0),),
                  ],
                ),
                SizedBox(height: 20,),
                Text(data['time'],style: TextStyle(color: Colors.white,fontSize: 66, letterSpacing: 2.0),),
                SizedBox(height: 20,),

                //Text(data['isDaytime'],style: TextStyle(fontSize: 66, letterSpacing: 2.0),),
              ],
            
                  ),
          )))
    );
  }
}
