
import 'package:digimanage/screens/creating_announcement/utils.dart';
import 'package:flutter/material.dart';

class NewAnnouncement extends StatelessWidget {
  const NewAnnouncement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Announcement", style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){ Navigator.pop(context);},icon: Icon(Icons.arrow_back,),),
        actions: [IconButton(onPressed: () {updateAnnouncement(context);}, icon:Icon(Icons.done,))],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
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
              ), // this is the title header

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: const InputDecoration (hintText: "Type title here",filled: false),
                    validator: (val) => val!.isEmpty? "Enter the title" : null,
                    onChanged: (val){announcement.title = val; },
                  )
              ),
              const SizedBox(height: 65,),
              const Text(
                "Title",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                  width: 300,
                  child: TextFormField(
                    maxLines: 8,
                    decoration: const InputDecoration (hintText: "Type description here",filled: false),
                    validator: (val) => val!.isEmpty? "Enter the description" : null,
                    onChanged: (val){announcement.title = val; },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
