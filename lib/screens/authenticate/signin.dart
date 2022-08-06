
import 'package:digimanage/services/authentication.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';


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
  Future<void> signIn(BuildContext context) async{
    if(_formKey.currentState!.validate()) {
      setState(() => loading=true);
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if(result!="login successful"){
        showSnackBar(result.toString(), context);
        setState(() {
          loading =false;
        }
        );
      }else{
        showSnackBar(result.toString(), context);
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
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Digimanage", style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: 30,),
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
                  Container(
                    width: double.infinity,
                    //height: 40,
                    child: ElevatedButton(
                      onPressed: () {signIn(context);},
                      child: Container(child : loading == true ? Container(height: 20,width: 20,child: CircularProgressIndicator(strokeWidth: 2,)) : Text("Login In")),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?  "),
                      GestureDetector(
                        child: Text("Sign up",style: TextStyle(color: Colors.blue),),
                        onTap: (){widget.toggleView();},
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
