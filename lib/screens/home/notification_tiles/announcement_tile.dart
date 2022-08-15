import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:flutter/material.dart';

class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;

  AnnouncementTile({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notificationDot,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationTypeAndHeading(type: announcement.isOfType(), heading: announcement.title),
                Text(announcement.description,
                    style: TextStyle(color: Colors.black.withOpacity(0.60))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
