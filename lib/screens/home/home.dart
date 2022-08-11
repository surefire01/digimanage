
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notify_ui_wrapper.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text("Home"), ),
        body: StreamProvider<List<Notify>?>.value(
          initialData: null,
          value: DatabaseService().meets,
          child: const Center(
            child: NotifyUI(),
          ),
        )

    );
  }
}
