import 'package:digimanage/models/base_screen.dart';
import 'package:digimanage/screens/base_screens/home.dart';
import 'package:digimanage/screens/base_screens/profile.dart';
import 'package:digimanage/screens/base_screens/tasks.dart';
import 'package:flutter/material.dart';


import '../base_screens/events.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentPage =0;

  BaseScreen currentScreen = baseHome;


  final baseScreens = <BaseScreen>[baseHome,tasks,baseHome,events,profile];

  //String details = "";
  void showCreateMenu(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Text("Select"),
            SizedBox(height: 20,),
            TextButton.icon(
              icon: Icon(Icons.people_outlined),
              label: Text("Meeting"),
              onPressed: ()async{
                await Navigator.pushNamed(context, "create ");
                Navigator.pop(context);
                },

            )
          ],
        ),
      );

    });
  }



  void Create (val, BuildContext context){
    if(val == 2){
      setState(() => currentPage = val);
      showCreateMenu(context);
      setState(() => currentPage = 0);
    }
    else{
      setState((){
        currentPage = val;
        currentScreen = baseScreens[currentPage];
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: currentScreen.appBar,
      body: currentScreen.body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (val){ Create(val, context); },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "home",),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: "tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "create",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "you"),
        ],
      ),
    );
  }
}
