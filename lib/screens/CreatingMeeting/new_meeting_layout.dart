import 'package:flutter/material.dart';

class NewMeetingLayout extends StatefulWidget {
  NewMeetingLayout({required this.title,required this.dateAndPlace,required this.details, required this.doneFunction }) {}

  Widget title;
  Widget dateAndPlace;
  Widget details;
  VoidCallback doneFunction;
  
  @override
  State<NewMeetingLayout> createState() => _NewMeetingLayoutState();
}

class _NewMeetingLayoutState extends State<NewMeetingLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("New Meeting"), actions: [IconButton(onPressed: widget.doneFunction, icon: Icon(Icons.done))],),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title, // For Title
              SizedBox(height: 50,),
              widget.dateAndPlace, // For Date and Place
              SizedBox(height: 50,),
              widget.details, // For Details
            ],
          ),
        )
    );
  }
}




