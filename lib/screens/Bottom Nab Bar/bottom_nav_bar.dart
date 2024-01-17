import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Add%20Complaints/add_complaints.dart';
import 'package:complaint_management/screens/Help%20and%20Support/help_and_support.dart';
import 'package:complaint_management/screens/Home/home_page.dart';
import 'package:complaint_management/screens/Profile%20Page/profile_page.dart';
import 'package:complaint_management/screens/View%20Complaints/view_complaints.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const HomePage(),
        const ViewComplaints(),
        const AddComplaints(),
        const HelpAndSupport(),
        const ProfilePage()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_rounded),
          title: ("Home"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.report_problem_outlined),
          title: ("Complaints"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add_rounded, color: Colors.white, size: 35,),
          title: ("Add"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.chat),
          title: ("Chat"),
          activeColorPrimary: color1,
          inactiveColorPrimary: color3,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
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
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
