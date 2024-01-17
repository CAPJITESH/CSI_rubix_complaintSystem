import 'package:complaint_management/auth/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text("Home"),
        ),
        ElevatedButton(
            onPressed: () {
              auth.HandleGoogleSignOut();
            },
            child: Text("SIGNOUT"))
      ],
    );
  }
}
