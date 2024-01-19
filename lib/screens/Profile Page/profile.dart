import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Profile%20Page/Profile%20Sliding%20panel%20items/change_password.dart';
import 'package:complaint_management/screens/Profile%20Page/Profile%20Sliding%20panel%20items/logout.dart';
import 'package:complaint_management/screens/Profile%20Page/Profile%20Sliding%20panel%20items/profile_details.dart';
import 'package:complaint_management/screens/Profile%20Page/Profile%20Sliding%20panel%20items/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PanelController _controller = PanelController();
  int index = 0;

  Widget _buildPanelContent() {
    if (index == 0) {
      return ProfiledetailsPage(
        controller: _controller,
      );
    } else if (index == 2) {
      return ChangePassworsSlidingPanel(
        controller: _controller,
      );
    } else if (index == 3) {
      return Settings(
        controller: _controller,
      );
    } else {
      return Logout(
        controller: _controller,
      );
    }
  }

  double _panelHeight() {
    if (index == 0 || index == 1) {
      return MediaQuery.of(context).size.height * 0.6;
    } else if (index == 2) {
      return MediaQuery.of(context).size.height * 0.52;
    } else {
      return MediaQuery.of(context).size.height * 0.25;
    }
  }

  bool isPanelOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  String name = '';
  String phoneNo = '';
  String email = "";
  addData() {
    FirebaseAuth auth = FirebaseAuth.instance;
    name = auth.currentUser!.displayName!;
    // phoneNo = auth.currentUser!.phoneNumber!;
    email = auth.currentUser!.email!;
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/profile_background.png"),
                          fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            if (phoneNo != "")
                              Text(
                                phoneNo,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                        isPanelOpen = true;
                        _controller.open();
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Profile details",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: color3,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                        _controller.open();
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: color3,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 3;
                        _controller.open();
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: color3,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 40,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 4;
                        _controller.open();
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: color3,
                ),
                const SizedBox(
                  height: 105,
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            controller: _controller,
            minHeight: 0.0,
            maxHeight: _panelHeight(),
            panelBuilder: (sc) {
              return _buildPanelContent();
            },
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            // backdropTapClosesPanel: true,
            // isDraggable: false,
            backdropEnabled: true,
            backdropColor: Colors.black,
            backdropOpacity: 0.4,
            onPanelOpened: () {
              isPanelOpen = true;
            },
            onPanelClosed: () {
              isPanelOpen = false;

              index = 0;
            },
          )
        ],
      ),
    );
  }
}
