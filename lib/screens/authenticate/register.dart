
import 'package:digimanage/services/authentication.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create your account", style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: 30,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Full Name"),
                    validator: (val) => val!.isEmpty? "Enter full name" : null,
                    onChanged: (val){setState(() => email = val); },
                  ), // Full Name

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Year"),
                          validator: (val) => val!.isEmpty? "Enter Year" : null,
                          onChanged: (val){setState(() => email = val); },
                        ),
                      ), //Year
                      Container(
                        width: 180,
                        child: TextFormField(
                          //keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(hintText: "Branch"),
                          validator: (val) => val!.isEmpty? "Enter branch" : null,
                          onChanged: (val){setState(() => email = val); },
                        ),
                      ), //Branch
                    ],
                  ), // year and branch

                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email Id"),
                    validator: (val) => val!.isEmpty? "Enter an email" : null,
                    onChanged: (val){setState(() => email = val); },
                  ), // Email Id
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    validator: (val) => val!.length < 6 ? "Password should contain atleast 8 characters":null ,
                    obscureText: true,
                    onChanged: (val){ setState(() => password=val); },
                  ), // passward
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: signUp,
                      child: Container(child : loading == true ? Container(height: 20,width: 20,child: CircularProgressIndicator(strokeWidth: 2,)) : Text("Sign up")),
                    ),
                  ), // Sign up
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an account already?  "),
                      GestureDetector(
                        child:const Text("Login In",style: TextStyle(color: Colors.blue),),
                        onTap: (){widget.toggleView();},
                      ),
                    ],
                  ), // Switch to Login Screen

                  

                ],
              ),
            )
        ),
      ),
    );
  }
}
