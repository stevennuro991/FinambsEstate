import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estate/components/location_icon.dart';
import 'package:estate/components/notification_icon.dart';
import 'package:estate/models/user_model.dart';
import 'package:estate/screens/chat.dart';
import 'package:estate/screens/home.dart';
import 'package:estate/screens/profile.dart';
import 'package:estate/screens/search_properties.dart';
import 'package:estate/screens/login_screen.dart';
import 'package:estate/screens/signup_screen.dart';
import 'package:estate/screens/wishlist.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/widgets/drawer.dart';

class MainScreen extends StatefulWidget {
  final int page;

  MainScreen({this.page = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
  int _currentTab = 0;
  Widget currentScreen = Home();
  String title;

  @override
  void initState() {
    _currentTab = widget.page;
    if (_currentTab == 1) currentScreen = SearchProperties();
    if (_currentTab == 2) currentScreen = Wishlist();
    if (_currentTab == 4) currentScreen = Profile();
    title = 'Welcome';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        appBar: customAppBar(),
        drawer: CustomDrawer(),
        bottomNavigationBar: customBottomNavigationBar(),
        body: Column(
          children: [
            Expanded(
              child: PageStorage(
                child: currentScreen,
                bucket: bucket,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*........................................Bottom Navigation bar.......................*/
  BottomAppBar customBottomNavigationBar() {
    return BottomAppBar(
      child: Container(
        height: 55,
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = Home();
                  _currentTab = 0;
                  title = 'Welcome';
                });
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/home.svg',
                      color: _currentTab == 0 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = SearchProperties();
                  _currentTab = 1;
                  title = 'Project';
                });
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/building.svg',
                      color: _currentTab == 1 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = Wishlist();
                  _currentTab = 2;
                  title = 'Favourite';
                });
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/heart.svg',
                      color: _currentTab == 2 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = Chat();
                  _currentTab = 3;
                  title = 'Chat';
                });
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/chat.svg',
                      color: _currentTab == 3 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = Profile();
                  _currentTab = 4;
                  title = 'Profile';
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/profile.svg',
                      color: _currentTab == 4 ? primaryColor : Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  /*........................................Custom AppBar.....................*/
  AppBar customAppBar() {
    return AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      leading: GestureDetector(
        onTap: () => _drawerKey.currentState?.openDrawer(),
        child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: const Color(0xff979696),
                height: 20,
              ),
            )),
      ),
      actions: [
        locationIcon(context),
        notificationIcon(context),
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()));
  }
}
