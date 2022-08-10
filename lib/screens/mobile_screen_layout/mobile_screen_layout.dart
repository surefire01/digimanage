
import 'package:digimanage/screens/mobile_screen_layout/utils.dart';
import 'package:flutter/material.dart';
import '../create_menue/create_menue.dart';



class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  int _page =0;
  late PageController pageController;

  @override
  void initState(){
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page,BuildContext context ){

    if(page == 2) {
      showCreateMenu(context);
      return;
    }
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState((){
      if(page == 2) return;
      _page = page;
    });
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: PageView(
        children: bottomNavigationBarItems,
        controller: pageController,
        onPageChanged:onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: (page) {navigationTapped(page,context);},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "home",),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: "tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "create",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "you"),
        ],
      ),
    );
  }
}
