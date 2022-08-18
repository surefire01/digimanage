import 'package:digimanage/models/home_screen_notifications/notify.dart';

class Poll implements Notify{

  String? question="";
  List<dynamic>? options = [];
  //bool multiple=false; will implement soon

  Poll({this.options,this.question});

  Poll.fromJson(Map map){
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
      'options' : options,
      'type' : isOfType()
    };
  }

  @override
  void clear() {
    // TODO: implement clear
    question = "";
    options!.clear();
  }

}