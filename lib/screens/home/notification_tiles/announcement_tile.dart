import 'package:digimanage/models/home_screen_notifications/announcement.dart';
import 'package:flutter/material.dart';


class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;
  AnnouncementTile({required this.announcement});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8,),
      child:Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          dense: true,
          //isThreeLine: true,
          contentPadding: EdgeInsets.fromLTRB(3,0,3,3),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(10,10,0,0),
            child: Icon(Icons.circle, color: Colors.blue,size: 18,),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Announcement",style: TextStyle(color: Colors.black.withOpacity(0.60)),),
              Text(announcement.title,style: TextStyle(fontSize: 14),),
            ],
          ),
          subtitle: Text(announcement.description,style: TextStyle(color: Colors.black.withOpacity(0.60))),
        ),
      ) ,
    );
  }
}
