import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/models/home_screen_notifications/notify.dart';
import 'package:digimanage/models/home_screen_notifications/poll.dart';

Notify? toGetNotification(Map map){
  switch (map["type"]) {
    case "Meeting":{
      return Meeting.fromJson(map);
    }
    case "Announcement":{
      return Announcement.fromJson(map);
    }
    case "Poll":{
      return Poll.fromJson(map);
    }
  }

  return null;
}