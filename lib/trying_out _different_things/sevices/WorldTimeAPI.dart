import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeApi{
  String time = "loading";
  String flag;
  String location;
  String url;
  bool? isDay;

  WorldTimeApi({required this.flag, required this.location, required this.url}){

  }

  Future<void> getTime() async{
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data=jsonDecode(response.body);
    DateTime datetime = DateTime.parse(data["datetime"]);
    String offset = data["utc_offset"].substring(1,3);
    datetime = datetime.add(Duration(hours: int.parse(offset)));
    isDay = datetime.hour > 6 && datetime.hour < 22;
    time = DateFormat.jm().format(datetime);
  }

}