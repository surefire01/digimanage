import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const colorIcons = Colors.cyan;


// ---------------------------------------------Meeting Title--------------------------------------------------------------
class MeetingTitle extends StatefulWidget {
  const MeetingTitle({Key? key}) : super(key: key);

  @override
  State<MeetingTitle> createState() => _MeetingTitle();
}

class _MeetingTitle extends State<MeetingTitle> {

  final meetTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( // It is for Label of Title
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text("Title", style: TextStyle(fontSize: 20),),
            // for Title label
            Text('0/30', style: TextStyle(fontSize: 16),)
            // for characters limit for title
          ],
        ),
        const SizedBox(height: 23,),
        SizedBox(
          width: 200,
          child: TextField(
            controller: meetTitle,
            decoration: const InputDecoration.collapsed(

                hintText: "Type title here ..."
            ),

          ),
        )
      ],
    );
  }
}

//---------------------------------------------------Meeting Date and Place-------------------------------------------------

class DateAndPlace extends StatefulWidget {
  const DateAndPlace({Key? key}) : super(key: key);

  @override
  State<DateAndPlace> createState() => _DateAndPlaceState();
}

class _DateAndPlaceState extends State<DateAndPlace> {

  DateTime? _dateTime ;
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);

  final venue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Date and Place", style: TextStyle(fontSize: 20)),
        const SizedBox(height: 23,),
        Row( // this is Row for date and time
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container( // this conatiner for Date selection
              width: 150,
              child: Row( // used row to to place IconButton and Date
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () async {
                    DateTime? newdateTime = await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2024));
                    if(newdateTime==null) return;
                    setState((){
                      _dateTime = newdateTime;
                    });
                    },
                      icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: colorIcons)
                      ),
                  Text(_dateTime == null ? "DD/ MM / YYYY" : DateFormat.yMMMd().format(_dateTime!), style: const TextStyle(
                      fontSize: 14, color: Colors.black),)
                ],
              ),
            ),
            SizedBox( // this is container for time Selection
              width: 116,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () async{
                    TimeOfDay? newTime = await showTimePicker(context: context, initialTime: time);
                    setState((){
                      time = newTime!;
                    });
                  },
                      icon: const Icon(
                        Icons.access_time_outlined, color: colorIcons,)),
                  Text(time.format(context).toString(), style: const TextStyle(
                      fontSize: 14, color: Colors.black),)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Container( // this is the container for Venue
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.location_on_outlined, color: colorIcons,),
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: venue,
                  decoration: const InputDecoration.collapsed(

                    hintText: "Type Venue..."
                  ),

                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}


//---------------------------------------------------Meeting Details------------------------------------------------------

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final meetDetails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Details", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 23,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {},
                  icon: const Icon(Icons.filter_list_sharp, color: Colors.blue,)),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: meetDetails,
                  decoration: const InputDecoration.collapsed(

                      hintText: "Details about the meeting\nEg: Specify the attendees"
                  ),

                ),
              )
            ],)
        ],
      ),
    );
  }
}
