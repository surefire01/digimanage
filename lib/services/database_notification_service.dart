import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/models/home_screen_notifications/utils.dart';
import 'package:digimanage/services/user_data_database_service.dart';




class DatabaseNotificationService{

  DatabaseNotificationService();

  // collection reference
  static final CollectionReference notifyCollection = FirebaseFirestore.instance.collection('notification');

  static Future createNotification(Notify notify)async{
    final docUser = notifyCollection.doc();
    notify.docId = docUser.id;
    return docUser.set(notify.toJson());
  }

  static Future deleteNotification(Notify notify)async{
    final docUser = notifyCollection.doc(notify.docId);
    if(notify.userUid == UserDatabaseService.curUserData!.uid) {
      docUser.delete();
    }
  }

  static Future readNotification(Notify notify)async{
    final docUser = notifyCollection.doc(notify.docId);
    docUser.update(
      {"read" : true}
    );
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