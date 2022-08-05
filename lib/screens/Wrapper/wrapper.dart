
import 'package:digimanage/models/user.dart';
import 'package:digimanage/screens/Home/home.dart';
import 'package:digimanage/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// this is not a page but this widgets checks if the useris logged in or not and based on that shows home scree or authentiate


// class Wrapper extends StatefulWidget {
//   const Wrapper({Key? key}) : super(key: key);
//
//   @override
//   State<Wrapper> createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserUid?>(context);
//     print(user?.uid);
//     return user == null ? Authenticate() : Home();
//
//   }
// }

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid?>(context);
    //print(user?.uid);
    return user == null ? Authenticate() : Home();

  }
}