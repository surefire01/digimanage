import 'package:flutter/material.dart';
import 'package:digimanage/models/home_screen_notifications/meeting.dart';

import '../../models/home_screen_notifications/notify.dart';

class MeetingTile extends StatelessWidget {

  final Meeting meeting;
  MeetingTile({required this.meeting});




  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(top: 8,),
      child:Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          dense: true,
          //isThreeLine: true,
          contentPadding: EdgeInsets.fromLTRB(3,0,3,3),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10,10,0,0),
            child: Icon(Icons.circle, color: Colors.blue,size: 18,),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Meeting",style: TextStyle(color: Colors.black.withOpacity(0.60)),),
              Text(meeting.title,style: TextStyle(fontSize: 14),),
            ],
          ),
          subtitle: Row(
            children: [
              Text(meeting.time,style: TextStyle(color: Colors.blue),),
              SizedBox(width: 25),
              Text(meeting.venue,style: TextStyle(color: Colors.blue)),
              SizedBox(width: 25,),
              Text(meeting.date,style: TextStyle(color: Colors.blue))
            ],
          ),
        ),
      ) ,
    );
  }
}
