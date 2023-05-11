import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location; // name for the UI
  String time= ""; //time in that location
  String flag; //url to an asset flag icon
  String url; // location url for api end point
  bool isDaytime=false;// true if daytime

  WorldTime({required this.location,required this .flag, required this.url});


  Future<void> getTime() async {



    // make the request
    Response  hijk = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(hijk.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    // create DateTime object
    DateTime rn = DateTime.parse(datetime);
    rn = rn.add(Duration(hours: int.parse(offset)));
    //print(rn);

    //set the time property
    isDaytime = rn.hour > 6 && rn.hour < 20 ? true : false;
    time = DateFormat.jm().format(rn);

  }
}
