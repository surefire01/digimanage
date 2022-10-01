
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Events"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children:  const [
            Text("No Events yet",style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
