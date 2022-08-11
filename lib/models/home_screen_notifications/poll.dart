import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Poll implements Notify{

  String question="";
  List<String> options = [];
  //bool multiple=false; will implement soon


  @override
  void formJson(Map map) {
    // TODO: implement formJson
    question = map['question'];
    options = map['options'];
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
      'options' : options
    };
  }

}