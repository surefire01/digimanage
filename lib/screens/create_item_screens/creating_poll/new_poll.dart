import 'package:digimanage/screens/create_item_screens/creating_poll/utils.dart';
import 'package:flutter/material.dart';

class NewPoll extends StatefulWidget {
  const NewPoll({Key? key}) : super(key: key);

  @override
  State<NewPoll> createState() => _NewPollState();
}

class _NewPollState extends State<NewPoll> {
  TextEditingController textEditingControllerOptions = TextEditingController();

  void removeOptions() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Poll"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                updatePoll(context);
              },
              icon: const Icon(
                Icons.done,
              ))
        ],
      ),
      body: Form(
        key: formKey,
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
                      hintText: "Type question here...",
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
              const Text(
                "Options",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView(
                  children: poll.options
                      .map((e) => OptionTile(
                            option: e,
                            removeOptions: removeOptions,
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 47,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: textEditingControllerOptions,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.circle_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    hintText: "Type option here...",
                    fillColor: Colors.grey[100],
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            poll.options.add(textEditingControllerOptions.text);
                            textEditingControllerOptions.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
