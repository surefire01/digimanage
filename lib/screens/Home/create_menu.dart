import "package:flutter/material.dart";



Map<String,IconData> lis =  {
  "Schedule a meeting" : Icons.people,
  "Take a poll" : Icons.poll_outlined,
  "Assign Tasks" : Icons.task_alt_outlined,
  "Make a announcement" : Icons.volume_up_outlined
};

var titles = <String>["Schedule a meeting",
    "Take a poll",
    "Assign Tasks" ,
    "Make a announcement"];

var icns = <IconData>[Icons.people,
  Icons.poll_outlined,
  Icons.task_alt_outlined,
  Icons.volume_up_outlined];

void showCreateMenu(BuildContext context){
  showModalBottomSheet(context: context, builder: (context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,10,0,0),
          child: Text("Notification",style: TextStyle(color: Colors.blue),),
        ),
        Expanded(
          child: ListView.builder(
            //restorationId: "Notification",
            itemCount: titles.length,
            itemBuilder: (context, index){
              return CreateTile(toDO: titles[index], icn:icns[index], index: index );
            },
          ),
        ),
      ],
    );

  });
}


class CreateTile extends StatelessWidget {

  final String toDO;
  final IconData icn;
  final int index;
  CreateTile({required this.toDO,required this.icn, required this.index});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: EdgeInsets.only(top: 8,),
      child:Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: (){
            Navigator.pushNamed(context, index.toString());
          },
          dense: true,
          //isThreeLine: true,
          contentPadding: EdgeInsets.fromLTRB(3,0,3,3),
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10,10,0,0),
            child: Icon(icn, color: Colors.blue,),
          ),
          title: Text(toDO, style: TextStyle(fontSize: 16),),
        ),
      ) ,
    );
  }
}
