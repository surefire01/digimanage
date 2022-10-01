
class UserUid{
  String uid;
  UserUid({required this.uid});
}

class UserData{
  String name ="";
  String year = "";
  String branch = "";
  String uid = "";
  String email = "";
  String? dpUrl = "";

  UserData({required this.name,required this.branch,required this.year,required this.uid, this.dpUrl,required this.email  });
  UserData.inst();
  UserData.fromJson(Map map){
    name = map["name"];
    branch = map["branch"];
    year = map["year"];
    uid = map["uid"];
    dpUrl = map["dpUrl"];
    email = map["email"];
  }

  Map<String,dynamic> toJson(){
    return {
      "name" : name,
      "year" : year,
      "branch" : branch,
      "uid" : uid,
      "dpUrl" : dpUrl,
      "email" : email
    };

  }


}