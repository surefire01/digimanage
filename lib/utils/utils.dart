import 'dart:typed_data';

import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/services/database_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';

const userPI = "Users: personal info";
const double avatarSize = 60;

const clubProPicUrl = "https://firebasestorage.googleapis.com/v0/b/digimanage-b61eb.appspot.com/o/Club%20Profile%20Pic%2FVATSALYA%20LOGO%20(FINAL)%20(2).png?alt=media&token=3dce8012-aaa0-4457-b3a0-b197195e4f72";

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

List<FocusedMenuItem> getFocusedMenuItems(Notify notify) => [
  FocusedMenuItem(title: const Text("Read"), onPressed: () {DatabaseNotificationService.readNotification(notify);},trailingIcon: const Icon(Icons.done_all, color: Colors.blue,)),
  FocusedMenuItem(title: const Text("Delete"), onPressed: (){DatabaseNotificationService.deleteNotification(notify);},trailingIcon: const Icon(Icons.delete,color : Colors.red))
];



final profilePic = CircleAvatar(
  radius: avatarSize,
  backgroundColor: Colors.grey.shade200,
  child: const Icon(Icons.person,size: avatarSize*2,color: Colors.white,),
);


class ProfilePic extends StatelessWidget {
  late Uint8List? _im;
  late String? _dpUrl;
  ProfilePic(this._im){
    _dpUrl = null;
  }

  ProfilePic.netIm(this._dpUrl){
    _im = null;
  }

  @override
  Widget build(BuildContext context) {

    if(_im != null) {
      return CircleAvatar(
      radius: avatarSize,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: MemoryImage(_im!),
    );
    } else if(_dpUrl != null) {
      return CircleAvatar(
      radius: avatarSize,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: NetworkImage(_dpUrl!),
    );
    }

    return CircleAvatar(
      radius: avatarSize,
      backgroundColor: Colors.grey.shade200,
      child: const Icon(Icons.person,size: avatarSize*2,color: Colors.white,),
    );

  }
}
