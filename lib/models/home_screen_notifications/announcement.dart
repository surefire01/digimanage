import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Announcement implements Notify{
  String title = "";
  String description = "";


  @override
  void formJson(Map map) {
    // TODO: implement formJson
    title = map["title"];
    description = map["description"];
  }

  @override
  String isOfType() {
    // TODO: implement isOfType
    return "Announcement";
  }

  @override
  Map<String,String> toJson() {
    // TODO: implement toJson
    return {
      "title" : title,
      "description": description,
      "type": isOfType()
    };
  }

}