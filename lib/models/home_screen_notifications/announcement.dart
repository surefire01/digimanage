import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Announcement implements Notify{
  String? title = "";
  String? description = "";

  Announcement({this.title,this.description});

  Announcement.fromJson(Map map){
    title = map["title"];
    description = map["description"];
  }

  @override
  void formJson(Map map) {
    // TODO: implement formJson

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
      "title" : title!,
      "description": description!,
      "type": isOfType()
    };
  }

  @override
  void clear() {
    // TODO: implement clear
    title = "";
    description = "";
  }

}