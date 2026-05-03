import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location; //location name for the UI
  String time = ""; // time in that location
  String flag; // URL   to an asset for flag
  String url; //location url for API end-point
  bool isDaytime=true; //test if day time or night time


  WorldTime({required this.location, required this.flag, required this.url});
  //make a request
  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://time.now/developer/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);


      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print(datetime);
      //print('$datetime - $offset');

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(datetime);
      print(offset);
      print(now);
      //set the time property

      isDaytime = now.hour>6&& now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print('\n\n\nError found : $e');
      time = 'couldnt get time';
    }
  }}
