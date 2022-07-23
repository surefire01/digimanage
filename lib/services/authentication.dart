import 'package:firebase_auth/firebase_auth.dart';
import 'package:digimanage/models/user.dart';
import 'package:digimanage/services/database.dart';



class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserUid? _userUIDfromUser (User? user){
    return user==null ? null : UserUid(uid: user.uid);
  }

  Stream<UserUid?> get user{
    return _auth.authStateChanges().map(_userUIDfromUser);
  }


  // sigm with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userUIDfromUser(result.user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      //create a new document for the user using uid

      return _userUIDfromUser(result.user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}