import 'package:digimanage/models/home_screen_notifications/poll.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../services/database_notification_service.dart';


Poll poll = Poll();
String tempOption = "";
final formKey = GlobalKey<FormState>();

updatePoll(BuildContext context){
  if(poll.options.isEmpty){
    showSnackBar("At least 1 option needed", context);
    return;
  }
  DatabaseNotificationService.createNotification(poll);
  poll.clear();
  Navigator.pop(context);
}

class OptionTile extends StatelessWidget {
  final String option;
  final Function removeOptions;
  OptionTile({required this.option, required this.removeOptions});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListTile(
        dense: true,
        //isThreeLine: true,
        contentPadding:const EdgeInsets.fromLTRB(3,0,3,3),
        leading: const Icon(Icons.circle_outlined, color: Colors.grey,size: 18,),
        title: Text(option),
        trailing: IconButton(
        icon: Icon(Icons.cancel_outlined, color: Colors.grey[300],size: 18,),
        onPressed: (){
          poll.options.remove(option);
          removeOptions();
        },),
        ),
      );
  }
}
