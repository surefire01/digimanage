import '../services/user_data_database_service.dart';

class ClubTask{
  bool read = false;
  String userUid = UserDatabaseService.curUserData!.uid;
  String docId = "";

  String title = "";
  String description = "";
  String time ="";
  String date ="";
  List<String> assignedTo = [];

  ClubTask();

  ClubTask.fromJson(Map map){
    title = map["title"];
    description = map["description"];
    userUid = map["uid"];
    read = map["read"];
    docId = map["docId"];
    date = map["date"];
    time = map["time"];
    assignedTo = map["assignedTo"];
  }


  Map<String,dynamic> toJson(){
    return {
      "title" : title,
      "date" : date,
      "time" : time,
      "description": description,
      "assignedTo" : assignedTo,
      "uid" : userUid,
      "read" : read,
      "docId" : docId
    } ;
  }

  void clear(){
    title = "";
    description = "";
    time ="";
    date ="";
    assignedTo.clear();
    userUid = UserDatabaseService.curUserData!.uid;
    read = false;
    docId = "";
  }

}