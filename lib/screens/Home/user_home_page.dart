import 'package:complaint_management/auth/auth.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Home/right_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<UserHomePage> {
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String name = auth.currentUser?.displayName ?? "";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                icon: SvgPicture.asset(
                  "assets/drawer_svg.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 17,
                  height: 19,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Hello ${name}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0).copyWith(top: 10, bottom: 0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 10,
            ),
            RightCard(
              title: 'Jago Grahak Jago',
              description:
                  'Jago Grahak Jago is a consumer awareness program launched in 2005 by the Department of Consumer Affairs under the Government of India. Under this scheme, various channels were created to spread awareness about consumer rights and to put an end to malpractices by merchants.',
              img: 'img1.png',
            ),
            RightCard(
              title: 'The Consumer Protection Act 2019',
              description:
                  'The Consumer Protection Act, implemented in 1986, gives easy and fast compensation to consumer grievances. It safeguards and encourages consumers to speak against insufficiency and flaws in goods and services. If traders and manufacturers practice any illegal trade, this act protects their rights as a consumer.',
              img: 'img2.jpg',
            ),
            /*ElevatedButton(
                onPressed: () {
                  auth.HandleGoogleSignOut();
                },
                child: Text("SIGNOUT"))*/
          ],
        ),
      ),
    );
  }
}
