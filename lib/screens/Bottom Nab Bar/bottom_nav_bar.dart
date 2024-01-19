import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Add%20Complaints/add_complaints.dart';
import 'package:complaint_management/screens/Chats/chatscreen.dart';
import 'package:complaint_management/screens/Help%20and%20Support/help_and_support.dart';
import 'package:complaint_management/screens/Home/business_home_page.dart';
import 'package:complaint_management/screens/Home/home_page.dart';
import 'package:complaint_management/screens/Profile%20Page/profile.dart';
import 'package:complaint_management/screens/Profile%20Page/profile_page.dart';
import 'package:complaint_management/screens/View%20Complaints/view_complaints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/user_home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  bool? isEmployee, isConsumer;
  String? role;
  int resolved = 0, pending = 0, review = 0;

  void getData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isEmployee = await prefs.getBool("isEmployee");
      isConsumer = await prefs.getBool('isConsumer');
      print(isEmployee.toString());
      print(isConsumer.toString());

      role = prefs.getString('role');

      if (isEmployee != null && role != null) {
        var snapshot = await FirebaseFirestore.instance
            .collection('Employee')
            .doc('Complaints')
            .get();

        if (snapshot.exists) {
          List<dynamic>? listOfRoles = snapshot.data()?['listOf$role'];

          if (listOfRoles != null) {
            for (var i = 0; i < listOfRoles.length; i++) {
              if (listOfRoles[i]['eid'] ==
                  FirebaseAuth.instance.currentUser!.uid) {
                resolved = listOfRoles[i]['resolvedComplaints'] ?? 0;
                pending = listOfRoles[i]['assignedComplaints'] ?? 2;
                review = listOfRoles[i]['inReviewComplaints'] ?? 0;
              }
            }
          }
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        false
            ? const UserHomePage()
            : BusinessHomePage(
                resolved: resolved, pending: pending, review: review),
        const ViewComplaints(),
        if (false) const AddComplaints(),
        ChatScreen(
          complaintId: '1233',
        ),
        const ProfilePage()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: ("Home"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.report_problem_outlined),
          title: ("Complaints"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        if (false)
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 35,
            ),
            title: ("Add"),
            activeColorPrimary: color1,
            inactiveColorPrimary: color3,
          ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.chat),
          title: ("Chat"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: false
          ? NavBarStyle.style15
          : NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
