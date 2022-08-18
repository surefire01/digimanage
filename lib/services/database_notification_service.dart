import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/models/home_screen_notifications/utils.dart';




class DatabaseNotificationService{

  //final String? uid;

  DatabaseNotificationService();//{this.uid});


  // collection reference
  final CollectionReference notifyCollection = FirebaseFirestore.instance.collection('notification');

  Future updateNotification(Notify notify)async{
    return notifyCollection.doc().set(notify.toJson());
  }

  List<Notify> _notificationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      var map = doc.data() as Map;

      return toGetNotification(map)!;
    }).toList();
  }

  // create a stream for the change in the database
  Stream<List<Notify>> get meets{
    return notifyCollection.snapshots().map(_notificationListFromSnapshot);
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