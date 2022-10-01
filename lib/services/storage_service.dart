import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService{
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // function to add image to storage
  Future<String> uploadImage(Uint8List file,String uid)async{
    Reference ref =  firebaseStorage.ref().child("User Profile Pics").child(uid);
    UploadTask uploadTask =   ref.putData(file);
    TaskSnapshot taskSnapshot =  await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}