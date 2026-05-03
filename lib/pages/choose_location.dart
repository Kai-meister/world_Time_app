import 'package:flutter/material.dart';
import 'package:world_time_project/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Phnom Penh',flag: 'cambodia.png', url: 'Asia/Phnom_Penh' ),
    WorldTime(location: 'Paris',flag: 'france.png', url: 'Europe/Paris' ),
    WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin' ),
    WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin' ),
    WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin' ),
    WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin' ),
  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    //navigator to home scrren

    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time':  instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 1.0,vertical: 4.0),
            child: Card(
          child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index]
                .flag}'),),
          ),
        ));
      },)
    );
  }
}
