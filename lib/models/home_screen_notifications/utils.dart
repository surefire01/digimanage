// function to decide which notify to create form json

import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';

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
  }

  Meeting meeting = Meeting();

  return meeting;
}