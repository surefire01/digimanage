import 'package:digimanage/Shared/Themes/primary_theme.dart';
import 'package:digimanage/models/user.dart';
import 'package:digimanage/screens/CreatingMeeting/new_meeting.dart';
import 'package:digimanage/screens/Home/home.dart';
import 'package:digimanage/screens/Wrapper/wrapper.dart';
import 'package:digimanage/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserUid?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        routes: {
          "create" : (context) => NewMeeting(),
        },
        theme: primaryTheme,
        home:Wrapper(),
      ),
    );
  }
}

