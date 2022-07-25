import 'package:digimanage/models/base_screen.dart';
import 'package:digimanage/models/meeting.dart';
import 'package:digimanage/screens/Home/meet_list.dart';
import 'package:digimanage/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


BaseScreen baseHome = BaseScreen(
  appBar: AppBar(title: Text("Title"),),
  body: StreamProvider<List<Meeting>?>.value(
    initialData: null,
    value: DatabaseService().meets,
    child: Center(
      child: MeetingList(),
    ),
  )
);