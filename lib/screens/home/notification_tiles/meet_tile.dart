import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';

class MeetingTile extends StatelessWidget {

  final Meeting meeting;
  const MeetingTile({required this.meeting});




  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(top: 8,),
      child:Card(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notificationDot,
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationTypeAndHeading(type: meeting.isOfType(), heading: meeting.title!),
                  Row(
                    children: [
                      Text(meeting.time!,style: TextStyle(color: Colors.blue),),
                      SizedBox(width: 25),
                      Text(meeting.venue!,style: TextStyle(color: Colors.blue)),
                      SizedBox(width: 25,),
                      Text(meeting.date!,style: TextStyle(color: Colors.blue))
                    ],
                  )
                ],
              ),
          ],
        ),
        ),
    );
  }
}
