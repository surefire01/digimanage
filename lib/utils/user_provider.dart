
import 'package:digimanage/models/user.dart';
import 'package:digimanage/services/user_data_database_service.dart';
import 'package:flutter/material.dart';

// class UserProvider with ChangeNotifier{
//   static UserData? userData;
//
//   UserDatabaseService userDatabaseService = UserDatabaseService();
//
//   UserData? getCurUser() => userData;
//
//   Future<void> refreshCurUser( ) async {
//     await userDatabaseService.getCurUserData();
//     notifyListeners();
//   }
// }