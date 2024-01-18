import 'package:complaint_management/screens/Bottom%20Nab%20Bar/bottom_nav_bar.dart';
import 'package:complaint_management/screens/Getting%20Started/getting_started.dart';
import 'package:complaint_management/screens/RoleSelection/roleSelection.dart';
import 'package:complaint_management/screens/Signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  bool? isRoleSelected;
  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isRoleSelected = prefs.getBool("role_selected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            // print(snapshot.data);
            if (isRoleSelected == null) {
              return const RoleSelection();
            } else {
              return const BottomNavBar();
            }
          } else {
            return const GettingStarted();
          }
        },
      ),
    );
  }
}
