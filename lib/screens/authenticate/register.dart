import 'package:digimanage/trying_out _different_things/loading.dart';
import 'package:digimanage/services/authentication.dart';
import 'package:flutter/material.dart';

import '../../Shared/Themes/primary_theme.dart';



class Register extends StatefulWidget {

  final Function toggleView;

  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // to sign up
  Future<void> signUp() async{
    if(_formKey.currentState!.validate()) {
      setState(() => loading=true);
      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
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
                  Text("Create your account"),
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
                    onPressed: signUp,
                    child: const Text("Sign up"),
                  ),
                  SizedBox(height: 20,),
                  Text("Have an account already?"),
                  GestureDetector(
                    child: Text("Login In",style: TextStyle(color: Colors.blue),),
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
