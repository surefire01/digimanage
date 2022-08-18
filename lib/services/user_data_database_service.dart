import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/user.dart';

class UserDatabaseService{
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  Future updateUserData(UserData userData)async{
    return userCollection.doc(userData.uid).collection("personal info").doc(userData.uid).set(userData.toJson());
  }



}