import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/screens/home/notification_tiles/utils.dart';
import 'package:digimanage/utils/Themes/primary_theme.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;

  AnnouncementTile({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: FocusedMenuHolder(
        blurBackgroundColor: focusedMenuHolderColor,
        onPressed: () {},
        openWithTap: true,
        menuItems: getFocusedMenuItems(announcement),
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notificationDot,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationTypeAndHeading(
                      type: announcement.isOfType(),
                      heading: announcement.title!),
                  Text(announcement.description!,
                      style: TextStyle(color: Colors.black.withOpacity(0.60))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
