import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/services/database_notification_service.dart';

Announcement announcement = Announcement();
final formKey = GlobalKey<FormState>();

DatabaseNotificationService toUpdateAnnouncement = DatabaseNotificationService();

updateAnnouncement(BuildContext context){
  if(formKey.currentState!.validate()) {
    dynamic re = toUpdateAnnouncement.updateNotification(announcement);
    print("Asdasdasdasd");
    print(re);
    Navigator.pop(context);

  }

}