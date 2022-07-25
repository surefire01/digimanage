import 'package:digimanage/models/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/services/authentication.dart';

BaseScreen profile = BaseScreen(body: Text("You"), appBar: AppBar(title: Text("Profile"),actions: [
  IconButton(onPressed: ()async{
    await AuthService().signOut();
  }, icon: Icon(Icons.logout_outlined))
],));