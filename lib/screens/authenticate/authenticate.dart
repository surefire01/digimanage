import 'package:digimanage/screens/authenticate/register.dart';
import 'package:digimanage/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';


// This page authenticates the user i.e. this is the Sigin or Signup page
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

// did some change to test the branching on git

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn? SignIn(toggleView: toggleView,) : Register(toggleView:toggleView ,);
  }
}
