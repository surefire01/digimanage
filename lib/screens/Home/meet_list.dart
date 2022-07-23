import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/meeting.dart';
import 'meet_tile.dart';

class MeetingList extends StatefulWidget {
  const MeetingList({Key? key}) : super(key: key);

  @override
  State<MeetingList> createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  @override

  Widget build(BuildContext context) {

    final Meetings = Provider.of<List<Meeting>?>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,10,0,0),
          child: Text("Notification",style: TextStyle(color: Colors.blue),),
        ),
        Expanded(
          child: ListView.builder(
            //restorationId: "Notification",
            itemCount: Meetings?.length ?? 0,
            itemBuilder: (context, index){
              return MeetingTile(meeting : Meetings![index]);
            },
          ),
        ),
      ],
    );
  }
}

