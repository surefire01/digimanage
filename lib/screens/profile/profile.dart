
import 'package:flutter/material.dart';
import 'package:digimanage/services/authentication.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Profile"),actions: [
        IconButton(onPressed: ()async{
          await AuthService().signOut();
        }, icon: const Icon(Icons.logout_outlined))
      ],),
      body: const Text("You"),
    );
  }
}
