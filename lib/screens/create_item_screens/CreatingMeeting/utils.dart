

import 'package:digimanage/models/home_screen_notifications/meeting.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:digimanage/services/database_notification_service.dart';

final formKey = GlobalKey<FormState>();

DatabaseNotificationService toUpdateMeet = DatabaseNotificationService();
Meeting newMeeting = Meeting();

TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);

// to get date form the date picker
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
      context: context, initialTime: time);
  return newTime!.format(context).toString();

}


void updateMeet (BuildContext context){

  // for now use snack bar to show msg if Date or time is not selected
  if(newMeeting.date!.isEmpty){
    showSnackBar("please select a date", context);
    return;
  }
  if(newMeeting.time!.isEmpty){
    showSnackBar("please select the time", context);
    return;
  }

  if(formKey.currentState!.validate()) {
    toUpdateMeet.updateNotification(newMeeting);
    newMeeting.clear();
    Navigator.pop(context);



  }
}
