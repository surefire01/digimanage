import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Meeting implements Notify{
  String time ="";
  String date ="";
  String title ="";
  String venue ="";


  @override
  Map<String,String> toJson(){
    return {
      "title" : title,
      "date" : date,
      "time" : time,
      "venue":venue,
      "type" : isOfType()
    } ;
  }

  @override
  void formJson(Map map) {
    // TODO: implement formJson
    date = map["date"]!;
    time = map["time"]!;
    title = map["title"]!;
    venue = map["venue"]!;
  }

  @override
  String isOfType() {
    // TODO: implement isOfType
    return "Meeting";
  }

}