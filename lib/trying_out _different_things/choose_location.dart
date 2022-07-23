import 'package:flutter/material.dart';
import "package:digimanage/trying_out _different_things/sevices/WorldTimeAPI.dart";

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTimeApi> locations = [
    WorldTimeApi(flag: "India.png", location: "Kolkata", url: "Asia/Kolkata"),
    WorldTimeApi(flag: "Portugal.png", location: "Lisbon", url: "Europe/Lisbon"),
    WorldTimeApi(flag: "Argentina.jpg", location: "Buenos Aires", url: "America/Argentina/Buenos_Aires")

  ];

  void updateTime(index) async {
    WorldTimeApi instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "flag": instance.flag,
      "location": instance.location,
      "time": instance.time,
      "isDay":instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){updateTime(index);},
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${locations[index].flag}"),
                //backgroundColor: Colors.amber,
              ),

            ),
          );
        },
      ),
    );
  }
}
