import 'package:digimanage/models/meeting.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:digimanage/services/database.dart';

const colorIcons = Colors.blue;

class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  final _formKey = GlobalKey<FormState>();

  DatabaseService toUpdateMeet = DatabaseService();
  Meeting newMeeting = Meeting();

  DateTime? _dateTime;
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);

  // to get date form the date picker
  Future getDate() async{
    DateTime? newdateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newdateTime == null) return;
    setState(() {
      newMeeting.date =  DateFormat.yMMMd().format(newdateTime);
    });
  }

  // to get time from the time picker
  Future getTime() async{
    TimeOfDay? newTime = await showTimePicker(
        context: context, initialTime: time);
    setState(() {
      newMeeting.time = newTime!.format(context).toString();
    });
  }


  void UpdateMeet (){

    if(_formKey.currentState!.validate()) {
      toUpdateMeet.updateMeeting(newMeeting);
      Navigator.pop(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Meeting", style: TextStyle(color: Colors.black),),
          leading: IconButton(onPressed: (){ Navigator.pop(context);},icon: Icon(Icons.arrow_back,),),
          actions: [IconButton(onPressed: () {UpdateMeet();}, icon:Icon(Icons.done,))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // It is for Label of Title
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Title",
                      style: TextStyle(fontSize: 20),
                    ),
                    // for Title label
                    Text(
                      '0/30',
                      style: TextStyle(fontSize: 16),
                    )
                    // for characters limit for title
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration (hintText: "Type title her",filled: false),
                    validator: (val) => val!.isEmpty? "Enter the title" : null,
                    onChanged: (val){setState(() => newMeeting.title = val); },
                  )
                ), // For Title
                SizedBox(
                  height: 45,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Date and Place", style: TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      // this is Row for date and time
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // this conatiner for Date selection
                          width: 150,
                          child: Row(
                            // used row to to place IconButton and Date
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () async{
                                    await getDate();
                                  },
                                  icon: const Icon(Icons.calendar_today_outlined,
                                      color: colorIcons)),
                              Text(
                                newMeeting.date.isEmpty ? "DD/ MM / YYYY"  : newMeeting.date,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          // this is container for time Selection
                          width: 116,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await getTime();
                                  },
                                  icon: const Icon(
                                    Icons.access_time_outlined,
                                    color: colorIcons,
                                  )),
                              Text(
                                newMeeting.time.isEmpty ? time.format(context).toString() : newMeeting.time,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // this is the container for Venue
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: colorIcons,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Type Venue", filled: false),
                              validator: (val) => val!.isEmpty ? "enter the venue":null ,
                              onChanged: (val){ setState(() => newMeeting.venue=val); },
                            ), //Venue
                          )
                        ],
                      ),
                    ),
                  ],
                ), // For Date and Place
                SizedBox(
                  height: 45,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Text("Details", style: TextStyle(fontSize: 20)),
                //     const SizedBox(
                //       height: 23,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         IconButton(
                //             onPressed: () {},
                //             icon: const Icon(
                //               Icons.filter_list_sharp,
                //               color: Colors.blue,
                //             )),
                //         SizedBox(
                //           width: 200,
                //           child: TextField(
                //             controller: meetDetails,
                //             decoration: const InputDecoration.collapsed(
                //                 hintText:
                //                     "Details about the meeting\nEg: Specify the attendees"),
                //           ),
                //         )
                //       ],
                //     )
                //   ],
                // ), // For Details
              ],
            ),
          ),
        ));
  }
}
