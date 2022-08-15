
import 'package:flutter/material.dart';

 Widget notificationDot = Padding(
  padding:  EdgeInsets.fromLTRB(15,20,15,0),
  child: Icon(Icons.circle,size: 13,color: Colors.blue.withOpacity(0.70),),
);
final Color colorOfNotification = Colors.black.withOpacity(0.60);

class NotificationTypeAndHeading extends StatelessWidget {
  final String type;
  final String heading;
  NotificationTypeAndHeading({required this.type,required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: Theme.of(context).textTheme.labelMedium!.copyWith(color: colorOfNotification)),
        Text(heading,style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
