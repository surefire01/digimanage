import 'package:digimanage/models/user.dart';
import 'package:digimanage/screens/profile/you_screen/edit_profile/edit_profile.dart';
import 'package:digimanage/services/user_data_database_service.dart';
import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';

class YouScreen extends StatefulWidget {
  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  UserData? userData ;

  @override
  void initState() {
    super.initState();
    updateCurUser();
  }

  void updateCurUser() async {
    userData = UserDatabaseService.curUserData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return userData == null
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
            child: Column(
              children: [
                ProfilePic.netIm(userData!.dpUrl),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  userData!.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userData!.branch,
                        style: Theme.of(context).textTheme.subtitle1),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(userData!.year,
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  userData!.email,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () async {
                          UserData? temp = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfile(userData!)));
                          userData = temp ?? userData;
                          setState(() {});

                        },
                        icon: const Icon(Icons.edit)),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey[100]!, width: 1.5),
                        bottom:
                            BorderSide(color: Colors.grey[100]!, width: 1.5)),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.people),
                    title: Text(
                      "Team Vatsalya",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                      "Main Coordinator",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
