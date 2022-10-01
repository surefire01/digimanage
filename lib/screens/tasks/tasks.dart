
import 'package:flutter/material.dart';


class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children:  const [
            Text("No tasks yet",style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
