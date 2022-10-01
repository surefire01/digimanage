import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/models/home_screen_notifications/poll.dart';
import 'package:digimanage/screens/home/notification_tiles/announcement_tile.dart';
import 'package:digimanage/screens/home/notification_tiles/poll_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/home_screen_notifications/notify.dart';
import 'notification_tiles/meet_tile.dart';

class NotifyUI extends StatelessWidget {
  const NotifyUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<Notify>?>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: notifications!.isNotEmpty
              ? const Text(
                  "Notification",
                  style: TextStyle(color: Colors.blue),
                )
              : const Text(
                  "No Notification yet",
                  style: TextStyle(color: Colors.blue),
                ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              switch (notifications[index].isOfType()) {
                case "Meeting":
                  {
                    return MeetingTile(
                        meeting:
                            Meeting.fromJson(notifications[index].toJson()));
                  }
                case "Announcement":
                  {
                    return AnnouncementTile(
                        announcement: Announcement.fromJson(
                            notifications[index].toJson()));
                  }

                case "Poll":
                  {
                    return PollTile(
                        poll: Poll.fromJson(notifications[index].toJson()));
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
