// this widget decides the notification type ui

import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/home_screen_notifications/notify.dart';
import 'meet_tile.dart';

class NotifyUI extends StatelessWidget {
  const NotifyUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final notifications = Provider.of<List<Notify>?>(context) ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,10,0,0),
          child: Text("Notification",style: TextStyle(color: Colors.blue),),
        ),
        Expanded(
          child: ListView.builder(
            //restorationId: "Notification",
            itemCount: notifications?.length ?? 0,
            itemBuilder: (context, index){

              switch (notifications![index].isOfType()) {

                case "Meeting" :{
                  Meeting meeting = Meeting();
                  meeting.formJson(notifications[index].toJson());
                  return MeetingTile(meeting : meeting);
                }

              }
              return Container();
            },
          ),
        ),
      ],
    );

  }
}
