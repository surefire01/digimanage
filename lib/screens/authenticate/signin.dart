import 'package:digimanage/trying_out _different_things/loading.dart';
import 'package:digimanage/services/authentication.dart';
import 'package:flutter/material.dart';

import '../../Shared/Themes/primary_theme.dart';



class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // to sign up
  Future<void> signIn() async{
    if(_formKey.currentState!.validate()) {
      setState(() => loading=true);
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if(result==null){
        setState(() {
          error= "please supply valid email";
          loading =false;
        }
        );
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Login"),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email Id"),
                    validator: (val) => val!.isEmpty? "Enter an email" : null,
                    onChanged: (val){setState(() => email = val); },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    validator: (val) => val!.length < 6 ? "Password should contain atleast 8 characters":null ,
                    obscureText: true,
                    onChanged: (val){ setState(() => password=val); },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: signIn,
                    child: const Text("Sign In"),
                  ),
                  SizedBox(height: 20,),
                  Text("Don't have an account?"),
                  GestureDetector(
                    child: Text("Sign up",style: TextStyle(color: Colors.blue),),
                    onTap: (){widget.toggleView();},
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
