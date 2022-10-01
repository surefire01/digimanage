import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/services/user_data_database_service.dart';

class Meeting implements Notify{
  String time ="";
  String date ="";
  String title ="";
  String venue = "";

  @override
  String docId = "";

  @override
  bool read = false;

  @override
  String userUid = UserDatabaseService.curUserData!.uid;

  Meeting({this.title = "",this.venue ="",this.time = "",this.date = "", String uid = "", this.docId = ""}){
    if(uid.isNotEmpty) {
      userUid = uid;
    }
  }

  Meeting.fromJson(Map map) {
    date = map["date"];
    time = map["time"];
    title = map["title"];
    venue = map["venue"];
    userUid = map["uid"];
    read = map["read"];
    docId = map["docId"];
  }

  @override
  Map<String,dynamic> toJson(){
    return {
      "title" : title,
      "date" : date,
      "time" : time,
      "venue": venue,
      "type" : isOfType(),
      "uid" : userUid,
      "read" : read,
      "docId" : docId
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
    userUid = UserDatabaseService.curUserData!.uid;
    read = false;
    docId = "";
  }






}