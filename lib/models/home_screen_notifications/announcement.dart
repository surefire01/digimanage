import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/services/user_data_database_service.dart';

class Announcement implements Notify{
  String? title = "";
  String? description = "";

  @override
  String docId = "";

  @override
  bool read = false;

  @override
  String userUid = UserDatabaseService.curUserData!.uid;

  Announcement({this.title,this.description, String uid = "", this.docId = ""}){
    userUid = uid.isNotEmpty ? uid : userUid;
  }

  Announcement.fromJson(Map map){
    title = map["title"];
    description = map["description"];
    userUid = map["uid"];
    read = map["read"];
    docId = map["docId"];
  }

  @override
  String isOfType() {
    // TODO: implement isOfType
    return "Announcement";
  }

  @override
  Map<String,dynamic> toJson() {
    // TODO: implement toJson
    return {
      "title" : title!,
      "description": description!,
      "type": isOfType(),
      "uid" : userUid,
      "read" : read,
      "docId" : docId
    };
  }

  @override
  void clear() {
    // TODO: implement clear
    title = "";
    description = "";
    userUid = UserDatabaseService.curUserData!.uid;
    read = false;
    docId = "";
  }





}