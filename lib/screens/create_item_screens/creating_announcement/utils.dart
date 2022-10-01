import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/services/database_notification_service.dart';

Announcement announcement = Announcement();
final formKey = GlobalKey<FormState>();

updateAnnouncement(BuildContext context){
  if(formKey.currentState!.validate()) {
    DatabaseNotificationService.createNotification(announcement);
    announcement.clear();
    Navigator.pop(context);
  }

}