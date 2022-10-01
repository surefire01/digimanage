import 'package:digimanage/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/services/database_notification_service.dart';
import 'package:intl/intl.dart';

ClubTask task = ClubTask();

final formKey = GlobalKey<FormState>();

Future getDate(BuildContext context) async{
  DateTime? newdateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2024));
  if (newdateTime == null) return;
  return DateFormat.yMMMd().format(newdateTime);

}

// to get time from the time picker
Future getTime(BuildContext context) async{
  TimeOfDay? newTime = await showTimePicker(
      context: context, initialTime: const TimeOfDay(hour: 12, minute: 00));
  return newTime!.format(context).toString();

}


updateClubTask(BuildContext context){
  if(formKey.currentState!.validate()) {
    //DatabaseNotificationService.createNotification(announcement);
    task.clear();
    Navigator.pop(context);
  }

}