import 'package:flutter/material.dart';

class HomeL extends StatefulWidget {
  const HomeL({Key? key}) : super(key: key);

  @override
  State<HomeL> createState() => _HomeLState();
}

class _HomeLState extends State<HomeL> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty? ModalRoute.of(context)?.settings.arguments as Map : data;
    //print(data);

    String bgImage = data["isDay"] ? "assets/day_for_project.jpg" : "assets/night_for_project.jpg" ;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 120,10,10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: ()async {
                   dynamic results = await Navigator.pushNamed(context,"/choose");
                   setState((){
                     data = {
                       "flag": results["flag"],
                       "location": results["location"],
                       "time": results["time"],
                       "isDay":results["isDay"]
                     };
                   });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("edit Location"),
                ),
                SizedBox(height: 20,),
                Text(data["location"], style: TextStyle(fontSize: 30),),
                SizedBox(height: 20,),
                Center(child: Text(data['time'], style: TextStyle(fontSize: 60)))
              ],
            ),
        ),
      ),
    );
  }
}

