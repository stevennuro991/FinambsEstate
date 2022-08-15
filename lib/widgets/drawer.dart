import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estate/models/user_model.dart';
import 'package:estate/screens/login_screen.dart';
import 'package:estate/utils/colorscheme.dart';

import '../screens/main_screen.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser =
      UserModel(email: '', firstName: '', lastName: '', phone: '', uid: '');

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('main');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen(
                                      page: 4,
                                    )));
                      },
                      child: Container(
                        height: 75,
                        margin: const EdgeInsets.only(left: 12, right: 6.0),
                        width: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/john.jpg'))),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${loggedInUser.firstName} ${loggedInUser.lastName}",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const Text(
                      '',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    )
                  ],
                ),
              ),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Home',
                  svgIconLoc: 'assets/icons/home_drawer.svg',
                  routeName: 'Dashboard'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Create a post',
                  svgIconLoc: 'assets/icons/add_property.svg',
                  routeName: 'AddProperty'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Search',
                  svgIconLoc: 'assets/icons/search_property.svg',
                  routeName: 'SearchProperty'),
              const Divider(
                color: dividerColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                              page: 1,
                            )),
                  );
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/new_project.svg',
                        color: dividerTextColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'New projects',
                        style: TextStyle(color: dividerTextColor),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: dividerColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(page: 2)),
                  );
                },
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/favourite.svg',
                        color: dividerTextColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Favorite',
                        style: TextStyle(color: dividerTextColor),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Search saved',
                  svgIconLoc: 'assets/icons/saved_searches.svg',
                  routeName: 'SavedSearches'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Agents',
                  svgIconLoc: 'assets/icons/agents.svg',
                  routeName: 'Agents'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'News',
                  svgIconLoc: 'assets/icons/news_and_blog.svg',
                  routeName: 'NewsAndBlog'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'About Us',
                  svgIconLoc: 'assets/icons/about_us.svg',
                  routeName: 'AboutUs'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Contact',
                  svgIconLoc: 'assets/icons/contact_us.svg',
                  routeName: 'ContactUs'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Terms and Policies',
                  svgIconLoc: 'assets/icons/terms_and_privacy.svg',
                  routeName: 'TermsAndConditions'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Settings',
                  svgIconLoc: 'assets/icons/setting.svg',
                  routeName: 'Settings'),
              const Divider(
                color: dividerColor,
              ),
              drawerTile(
                  title: 'Log Out',
                  svgIconLoc: 'assets/icons/logout.svg',
                  routeName: 'SignIn'),
              const Divider(
                color: dividerColor,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawerTile(
      { String title,
       String svgIconLoc,
       String routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 40,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              svgIconLoc,
              color: dividerTextColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(color: dividerTextColor),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()));
  }
}
