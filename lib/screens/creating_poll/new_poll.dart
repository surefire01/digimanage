import 'package:digimanage/screens/creating_poll/utils.dart';
import 'package:flutter/material.dart';

class NewPoll extends StatefulWidget {
  const NewPoll({Key? key}) : super(key: key);

  @override
  State<NewPoll> createState() => _NewPollState();
}

class _NewPollState extends State<NewPoll> {

  TextEditingController textEditingControllerOptions = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Poll",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                updatePoll(context);
              },
              icon: Icon(
                Icons.done,
              ))
        ],
      ),
      body: Form(
        key: formKey ,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // It is for Label of Title
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Question",
                    style: TextStyle(fontSize: 20),
                  ),
                  // for Title label
                  Text(
                    '0/100',
                    style: TextStyle(fontSize: 16),
                  )
                  // for characters limit for title
                ],
              ),
              SizedBox(
                  width: 300,
                  child: TextFormField(
                    initialValue: poll.question,
                    decoration: const InputDecoration(
                        hintText: "Type question here",
                        filled: false,
                       ),
                    //scrollPadding: EdgeInsets.all(0),
                    //maxLines: 2,
                    validator: (val) =>
                        val!.isEmpty ? "Enter the question" : null,
                    onChanged: (val) {
                      poll.question = val;
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text("Options",style: TextStyle(fontSize: 20),),
              poll.options.isEmpty? Container() :
                  Column(
                     children: poll.options.map((e) => OptionTile(option: e)).toList(),
                  ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingControllerOptions,
                decoration:  InputDecoration(
                    hintText: "Type option here",
                    filled: false,
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            poll.options.add(textEditingControllerOptions.text);
                            textEditingControllerOptions.clear();
                          });
                        },
                        icon: Icon(
                          Icons.done,
                          color: Colors.grey,
                        ))),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
