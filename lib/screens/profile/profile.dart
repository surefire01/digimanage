import 'package:digimanage/screens/profile/you_screen/you_screen.dart';
import 'package:flutter/material.dart';
import 'package:digimanage/services/authentication.dart';
import 'package:provider/provider.dart';

import '../../utils/user_provider.dart';
import 'club_screen/club_screen.dart';

class Profile extends StatefulWidget  {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.grey,
          bottomOpacity: 1,
          title: const Text("Profile"),
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthService().signOut();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 12),
            labelPadding: EdgeInsets.symmetric(vertical: 0),
            overlayColor: MaterialStateProperty.all<Color?>(Colors.white),
            controller: tabController,
            labelColor: const Color.fromRGBO(43, 44, 44, 1.0),
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.white,
            indicatorWeight: 1.0,
            indicator: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(18)),
            tabs: const [
              Tab(
                height: 35,
                text: 'You',
              ),
              Tab(
                height: 35,
                text: 'Club',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            YouScreen(),
            ClubScreen(),
          ],
        ),
    );
  }
}

