import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/models/home_screen_notifications/utils.dart';



class DatabaseService{

  final String? uid;

  DatabaseService({this.uid});


  // collection reference
  final CollectionReference meetingCollection = FirebaseFirestore.instance.collection('meeting');

  Future updateMeeting(Meeting newMeeting)async{
    return meetingCollection.doc().set(newMeeting.toJson());
  }

  List<Notify> _meetingListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      var lis = doc.data() as Map;

      return toGetNotification(lis);
    }).toList();
  }

  // create a stream for the change in the database
  Stream<List<Notify>> get meets{
    return meetingCollection.snapshots().map(_meetingListFromSnapshot);
  }

  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot ){
  //   var lis = snapshot.data() as Map;
  //   return UserData(sugars: lis['sugars'] , name: lis['name'], strength: lis['strength'], uid: uid);
  // }
  //
  // Stream<UserData> get userData{
  //   return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  // }


}