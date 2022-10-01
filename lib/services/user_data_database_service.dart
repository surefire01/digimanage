import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDatabaseService{

  static UserData? curUserData;

  final CollectionReference usersPersonalInfoCollection = FirebaseFirestore.instance.collection('Users: personal info');

  Future updateUserData(UserData userData)async{
    return usersPersonalInfoCollection.doc(userData.uid).set(userData.toJson());
  }

  // Future<UserData> getCurUserData() async{
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(userPI).doc(FirebaseAuth.instance.currentUser!.uid).get();
  //   return UserData.fromJson(snapshot.data() as Map);
  // }

  static Future<UserData> getCurUserData() async{
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Users: personal info').doc(FirebaseAuth.instance.currentUser!.uid).get();
    curUserData =  UserData.fromJson(snapshot.data() as Map);
    return curUserData!;
  }


  // Stream<UserData?> get curUserData{
  //   return usersPersonalInfoCollection.snapshots().map((event) {
  //     dynamic map = event as Map;
  //     if(map["uid"] == FirebaseAuth.instance.currentUser!.uid){
  //       return UserData.fromJson(map);
  //     }
  //     return null;
  //   });
  // }

}