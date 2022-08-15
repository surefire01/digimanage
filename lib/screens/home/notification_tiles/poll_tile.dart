
import 'package:digimanage/models/home_screen_notifications/poll.dart';
import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/Themes/text_theme.dart';

class PollTile extends StatelessWidget {
  final Poll poll;
  PollTile({required this.poll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8,),
      child:Card(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            notificationDot,
            NotificationTypeAndHeading(type: poll.isOfType(), heading: poll.question)
          ],
        )
      ) ,
    );
  }
}
