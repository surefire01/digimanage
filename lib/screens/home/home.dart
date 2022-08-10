
import 'package:digimanage/models/meeting.dart';
import 'package:digimanage/screens/home/meet_list.dart';
import 'package:digimanage/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text("Home"), ),
        body: StreamProvider<List<Meeting>?>.value(
          initialData: null,
          value: DatabaseService().meets,
          child: const Center(
            child: MeetingList(),
          ),
        )

    );
  }
}
