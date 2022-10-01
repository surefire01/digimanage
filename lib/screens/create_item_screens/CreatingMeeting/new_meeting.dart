import 'package:digimanage/screens/create_item_screens/CreatingMeeting/utils.dart';
import 'package:flutter/material.dart';


const colorIcons = Colors.blue;

class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Meeting"),
          leading: IconButton(onPressed: (){ Navigator.pop(context);},icon: Icon(Icons.arrow_back,),),
          actions: [IconButton(onPressed: () {updateMeet(context);}, icon:Icon(Icons.done,))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
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
                    initialValue: newMeeting.title,
                    decoration: const InputDecoration (hintText: "Type title here",filled: false),
                    validator: (val) => val!.isEmpty? "Enter the title" : null,
                    onChanged: (val){setState(() => newMeeting.title = val); },
                  )
                ), // For Title
                const SizedBox(
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

                                    String date = await getDate(context);
                                    setState((){
                                      newMeeting.date = date;
                                    });
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
                                    String time = await getTime(context);
                                    setState((){
                                      newMeeting.time = time;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.access_time_outlined,
                                    color: colorIcons,
                                  )),
                              Text(
                                newMeeting.time.isEmpty ? const TimeOfDay(hour: 12, minute: 00).format(context).toString() : newMeeting.time,
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
                    Row(
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
                            initialValue: newMeeting.venue,
                            decoration: const InputDecoration(hintText: "Type Venue", filled: false),
                            validator: (val) => val!.isEmpty ? "enter the venue":null ,
                            onChanged: (val){ setState(() => newMeeting.venue=val); },
                          ), //Venue
                        )
                      ],
                    ),
                  ],
                ), // For Date and Place
                const SizedBox(
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
