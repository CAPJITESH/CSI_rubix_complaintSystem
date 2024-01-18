import 'package:complaint_management/screens/Bottom%20Nab%20Bar/bottom_nav_bar.dart';
import 'package:complaint_management/screens/Signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

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

          return BottomNavBar();
          
          /*if (snapshot.hasData) {
            print(snapshot.data);
            return BottomNavBar();
          } else {
            return SignUp();
          }*/
        },
      ),
    );
  }
}
