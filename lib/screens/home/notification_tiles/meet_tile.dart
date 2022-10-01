import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:focused_menu/focused_menu.dart';

import '../../../utils/Themes/primary_theme.dart';

class MeetingTile extends StatelessWidget {

  final Meeting meeting;
  const MeetingTile({required this.meeting});


  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.only(top: 8,),
      child:FocusedMenuHolder(
        blurBackgroundColor: focusedMenuHolderColor,
        onPressed: (){},
        openWithTap: true,
        menuItems: getFocusedMenuItems(meeting),
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notificationDot,
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationTypeAndHeading(type: meeting.isOfType(), heading: meeting.title),
                    Row(
                      children: [
                        Text(meeting.time,style: const TextStyle(color: Colors.blue),),
                        const SizedBox(width: 25),
                        Text(meeting.venue,style: const TextStyle(color: Colors.blue)),
                        const SizedBox(width: 25,),
                        Text(meeting.date,style: const TextStyle(color: Colors.blue))
                      ],
                    )
                  ],
                ),
            ],
          ),
          ),
      ),
    );
  }
}
