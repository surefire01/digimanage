
import 'package:digimanage/models/home_screen_notifications/poll.dart';
import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';

import '../../../utils/Themes/primary_theme.dart';


class PollTile extends StatelessWidget {
  final Poll poll;
  PollTile({required this.poll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,),
      child:FocusedMenuHolder(
        blurBackgroundColor: focusedMenuHolderColor,
        onPressed: (){},
        openWithTap: true,
        menuItems: getFocusedMenuItems(poll),
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              notificationDot,
              NotificationTypeAndHeading(type: poll.isOfType(), heading: poll.question)
            ],
          )
        ),
      ) ,
    );
  }
}
