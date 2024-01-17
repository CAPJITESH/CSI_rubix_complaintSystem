import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Signup/signup.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: color1,
              ),
              Positioned(
                top: 28.0,
                right: 18.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            // width: ,
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3, // Number of pages
                    (index) => _currentPage == index
                        ? Container(
                            margin: const EdgeInsets.all(8),
                            height: 8,
                            width: 20,
                            decoration: BoxDecoration(
                              color: color1,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        : Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color3,
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      // Page 1
                      Container(
                        color: Colors.white,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 9,
                            ),
                            Text(
                              "Lets Get Started",
                              style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'with your trusted',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                            Text(
                              'companion for optimal water purification!',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                          ],
                        ),
                      ),

                      // Page 2
                      Container(
                        color: Colors.white,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 9,
                            ),
                            Text(
                              "Lets Get Started",
                              style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'with your trusted',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                            Text(
                              'companion for optimal water purification!',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                          ],
                        ),
                      ),

                      // Page 3
                      Container(
                        color: Colors.white,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 1 / 9,
                            ),
                            Text(
                              "Lets Get Started",
                              style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'with your trusted',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                            Text(
                              'companion for optimal water purification!',
                              style: TextStyle(color: color1, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 165,
                                decoration: BoxDecoration(
                                    color: color1,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
