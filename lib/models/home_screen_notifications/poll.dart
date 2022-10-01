import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/services/user_data_database_service.dart';

class Poll implements Notify{

  String question="";
  List<dynamic> options = [];
  //bool multiple=false; will implement soon

  @override
  String docId = "";

  @override
  bool read = false;

  @override
  String userUid = UserDatabaseService.curUserData!.uid;

  Poll({List<dynamic> options = const [],this.question = "", String uid = "", this.docId = ""}){
    this.options = options.isNotEmpty ? options : this.options;
    userUid = uid.isNotEmpty ? uid : userUid;
  }

  Poll.fromJson(Map map){
    question = map['question'];
    options = map['options'];
    userUid = map["uid"];
    read = map["read"];
    docId = map["docId"];
  }


  @override
  String isOfType() {
    // TODO: implement isOfType
    return "Poll";
  }

  @override
  Map<String,dynamic> toJson() {
    // TODO: implement toJson
    return {
      'question' : question,
      'options' : options,
      'type' : isOfType(),
      'read' : read,
      "uid" : userUid,
      "docId" : docId
    };
  }

  @override
  void clear() {
    // TODO: implement clear
    question = "";
    options.clear();
    userUid = UserDatabaseService.curUserData!.uid;
    read =false;
    docId = "";
  }

}