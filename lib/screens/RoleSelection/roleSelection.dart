import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Bottom%20Nab%20Bar/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  TextEditingController role = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController technicalPosition = TextEditingController();
  TextEditingController branch = TextEditingController();

  List<String> roleList = ['Consumer', "Business Person"];
  List<String> technicalPositionList = [
    "Technical issue",
    "Mechanical Issue",
    "Service Issue",
    "Other"
  ];
  List<String> brnachList = ["Mumbai", "Goregoan", "Thane", "Mulund"];

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("role_selected", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 170,
            width: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/amico.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Select A Role to Continue",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.89,

                    initialSelection: roleList.first,
                    textStyle: const TextStyle(fontSize: 14),
                    label: Text(
                      "Select Role",
                      style: TextStyle(color: color3),
                    ),
                    trailingIcon: Icon(
                      CupertinoIcons.chevron_down,
                      color: color3,
                    ),
                    selectedTrailingIcon: Icon(
                      CupertinoIcons.chevron_up,
                      color: color3,
                    ),
                    menuStyle: const MenuStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    inputDecorationTheme: InputDecorationTheme(
                      constraints: const BoxConstraints(maxHeight: 50),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: color3),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color3),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    onSelected: (String? value) {
                      setState(() {
                        role.text = value!;
                      });
                    },
                    controller: role,
                    // underline: SizedBox.shrink(),
                    dropdownMenuEntries:
                        roleList.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (role.text == "Business Person")
                    Column(
                      children: [
                        DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width * 0.89,

                          initialSelection: brnachList.first,
                          textStyle: const TextStyle(fontSize: 14),
                          label: Text(
                            "Select Branch",
                            style: TextStyle(color: color3),
                          ),
                          trailingIcon: Icon(
                            CupertinoIcons.chevron_down,
                            color: color3,
                          ),
                          selectedTrailingIcon: Icon(
                            CupertinoIcons.chevron_up,
                            color: color3,
                          ),
                          menuStyle: const MenuStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          inputDecorationTheme: InputDecorationTheme(
                            constraints: const BoxConstraints(maxHeight: 50),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: color3),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color3),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onSelected: (String? value) {
                            setState(() {
                              branch.text = value!;
                            });
                          },
                          controller: branch,
                          // underline: SizedBox.shrink(),
                          dropdownMenuEntries: brnachList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width * 0.89,

                          initialSelection: technicalPositionList.first,
                          textStyle: const TextStyle(fontSize: 14),
                          label: Text(
                            "Select Position",
                            style: TextStyle(color: color3),
                          ),
                          trailingIcon: Icon(
                            CupertinoIcons.chevron_down,
                            color: color3,
                          ),
                          selectedTrailingIcon: Icon(
                            CupertinoIcons.chevron_up,
                            color: color3,
                          ),
                          menuStyle: const MenuStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          inputDecorationTheme: InputDecorationTheme(
                            constraints: const BoxConstraints(maxHeight: 50),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: color3),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color3),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onSelected: (String? value) {
                            setState(() {
                              technicalPosition.text = value!;
                            });
                          },
                          controller: technicalPosition,
                          // underline: SizedBox.shrink(),
                          dropdownMenuEntries: technicalPositionList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (role.text != "")
                    ElevatedButton(
                      onPressed: () async {
                        CollectionReference employees =
                            FirebaseFirestore.instance.collection('employees');

                        await employees.add({
                          "eid": auth.currentUser?.uid,
                          'employee name': auth.currentUser?.displayName,
                          'email': auth.currentUser?.email,
                          'role': role.text,
                          'assigned_complaints': 0,
                          'resolved_complaints': 0,
                          'inReview_complaints': 0
                        });

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(
                          double.infinity,
                          40,
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
