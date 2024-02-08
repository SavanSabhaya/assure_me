import 'package:assure_me/constant.dart';
import 'package:assure_me/routes/routes.dart';
import 'package:assure_me/view/screens/dashboard/aleart_page.dart';
import 'package:assure_me/view/screens/dashboard/main_menu.dart';
import 'package:assure_me/view/screens/password/change_password.dart';
import 'package:assure_me/view/screens/profile/profile.dart';
import 'package:assure_me/view/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  final _buildBody = [
    MainMenu(),
    AlertsPage(),
    Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProfileController().profile(context:  context, setState: setState);
    ProfileController().deviceList(context: context ,setState: setState);
    // getOfflineAleart();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: AnimatedContainer(
          color: dfColor,
          duration: const Duration(seconds: 1),
          child: _buildBody[_selectedItemPosition],
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          // height: 40,
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: EdgeInsets.all(0),
          snakeViewColor: appcolor,
          selectedItemColor: snakeShape == SnakeShape.indicator ? appcolor : null,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 35,
                ),
                label: 'tickets'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                  size: 35,
                ),
                label: 'search')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
