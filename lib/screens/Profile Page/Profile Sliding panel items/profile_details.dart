import 'package:complaint_management/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/widgets/textfield.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// ignore: must_be_immutable
class ProfiledetailsPage extends StatefulWidget {
  PanelController controller;
  ProfiledetailsPage({super.key, required this.controller});

  @override
  State<ProfiledetailsPage> createState() => _ProfiledetailsPageState();
}

class _ProfiledetailsPageState extends State<ProfiledetailsPage> {
  TextEditingController firstname = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController mobileno = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool valueCheck = false;

  @override
  // void dispose() {
  //   firstname.clear();
  //   lastname.clear();
  //   email.clear();
  //   mobileno.clear();

  //   widget.controller.close();

  //   super.dispose();
  // }

  void initState() {
    // TODO: implement initState
    addData();
    super.initState();
  }

  addData() {
    FirebaseAuth auth = FirebaseAuth.instance;
    firstname.text = auth.currentUser?.displayName ?? "";
    email.text = auth.currentUser?.email ?? "";
    mobileno.text = auth.currentUser?.phoneNumber ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 10, 28, 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile Details",
                  style: TextStyle(
                      fontSize: 18, color: color2, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      widget.controller.close();

                      // dispose();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      size: 28,
                      color: color2,
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextBox(
              controller: firstname,
              label: "Name",
              obscureText: false,
              hinttext: "Name",
              height: 55,
            ),
            const SizedBox(
              height: 8,
            ),
            TextBox(
              controller: mobileno,
              label: "Mobile number",
              hinttext: "Mobile number",
              obscureText: false,
              height: 55,
              isNumber: true,
              icon: Icons.phone_android_rounded,
            ),
            const SizedBox(
              height: 8,
            ),
            TextBox(
              controller: email,
              label: "Email Address",
              hinttext: "Email Address",
              obscureText: false,
              height: 55,
              validator: (value) {
                if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                    .hasMatch(value!)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              icon: Icons.mail_rounded,
            ),
            // const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: valueCheck,
                  onChanged: (value) {
                    setState(() {
                      valueCheck = !valueCheck;
                    });
                  },
                  activeColor: color2,
                  checkColor: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      "I would like to get service updates on ",
                      style: TextStyle(
                        fontSize: 12,
                        color: color3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(
                      "assets/whatsapp.png",
                      width: 14,
                      height: 14,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  dispose();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(double.infinity, 55.0),
              ),
              child: Text('UPDATE DETAILS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
