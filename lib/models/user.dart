
class UserUid{
  String uid;
  UserUid({required this.uid});
}

class UserData{
  String name ="";
  String year = "";
  String branch = "";
  String uid = "";
  String? dpUrl = "";

  UserData({required this.name,required this.branch,required this.year,required this.uid, this.dpUrl  });

  UserData.fromJson(Map map){
    name = map["Name"];
    branch = map["Branch"];
    year = map["Year"];
    uid = map["UID"];
    dpUrl = map["dpUrl"];
  }

  Map<String,dynamic> toJson(){
    return {
      "Name" : name,
      "Year" : year,
      "Branch" : branch,
      "UID" : uid,
      "dpUrl" : dpUrl
    };

  }


}