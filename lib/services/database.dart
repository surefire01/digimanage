import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/meeting.dart';
import 'package:digimanage/models/user.dart';


class DatabaseService{

  final String? uid;

  DatabaseService({this.uid});


  // collection reference
  final CollectionReference meetingCollection = FirebaseFirestore.instance.collection('meeting');

  Future updateMeeting(Meeting newMeeting)async{
    return meetingCollection.doc().set({
      "title" : newMeeting.title,
      "date" : newMeeting.date,
      "time" : newMeeting.time,
      "venue":newMeeting.venue
    });
  }

  List<Meeting> _meetingListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      Meeting newMeeting = Meeting();
      var lis = doc.data() as Map;
      newMeeting.date= lis["date"];
      newMeeting.time= lis["time"];
      newMeeting.title= lis["title"];
      newMeeting.venue= lis["venue"];

      return newMeeting;
    }).toList();
  }

  // create a stream for the change in the database
  Stream<List<Meeting>> get meets{
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