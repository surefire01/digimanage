// function to decide which notify to create form json

import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/models/home_screen_notifications/poll.dart';

Notify toGetNotification(Map map){
  switch (map["type"]) {
    case "Meeting":{
      Meeting newMeeting = Meeting();
      newMeeting.formJson(map);
      return newMeeting;
    }
    case "Announcement":{
      Announcement announcement = Announcement();
      announcement.formJson(map);
      return announcement;
    }
    case "Poll":{
      Poll poll = Poll();
      poll.formJson(map);
      return poll;
    }
  }

  Meeting meeting = Meeting();

  return meeting;
}