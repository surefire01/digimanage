import 'package:flutter/material.dart';

class AppBarComponent extends AppBar {

  @override
  String heading ;
  IconData back;
  IconData done;


  @override
  AppBarComponent({ required this.heading, required this.back, required this.done}) ;

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.heading, style: TextStyle(color: Colors.black),),
      shape: Border(
        bottom: BorderSide(color: Colors.black12, width: 0.5)
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(icon: Icon(widget.back),onPressed: (){},color: Colors.black),
      actions: [IconButton(icon: Icon(widget.done),onPressed: (){},color: Colors.black)],

    );
  }
}
