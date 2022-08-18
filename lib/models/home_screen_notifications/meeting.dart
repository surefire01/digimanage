import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Meeting implements Notify{
  String? time ="";
  String? date ="";
  String? title ="";
  String? venue ="";

  Meeting({this.title,this.venue,this.time,this.date,});

  Meeting.fromJson(Map map) {
    date = map["date"]!;
    time = map["time"]!;
    title = map["title"]!;
    venue = map["venue"]!;
  }

  @override
  Map<String,String> toJson(){
    return {
      "title" : title!,
      "date" : date!,
      "time" : time!,
      "venue":venue!,
      "type" : isOfType()
    } ;
  }

  @override
  String isOfType() {
    // TODO: implement isOfType
    return "Meeting";
  }

  @override
  void clear() {
    // TODO: implement clear
    date = "";
    title = "";
    time = "";
    venue = "";
  }

}