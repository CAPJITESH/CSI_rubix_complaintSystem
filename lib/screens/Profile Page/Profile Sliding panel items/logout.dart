import 'package:complaint_management/auth/auth.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Getting%20Started/getting_started.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mahavar_eurotech/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Logout extends StatelessWidget {
  final PanelController controller;
  const Logout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 10, 28, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                    fontSize: 18, color: color2, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  controller.close();
                },
                icon: Icon(
                  Icons.close_rounded,
                  size: 28,
                  color: color2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Are you sure you want to logout of Mahavar Eurotech",
            style: TextStyle(
                fontSize: 13, color: color3, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: color3,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: color1, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(140, 50.0),
                ),
                child: Text('Cancel',
                    style: TextStyle(
                        color: color1,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              ElevatedButton(
                onPressed: () async {
                  AuthService auth = AuthService();
                  await auth.HandleGoogleSignOut();

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const GettingStarted()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color1,
                  shadowColor: color3,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: color1, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: const Size(140, 50.0),
                ),
                child: const Text('Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
