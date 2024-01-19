import 'package:complaint_management/auth/auth.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Home/pie_chart.dart';
import 'package:complaint_management/screens/Home/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessHomePage extends StatefulWidget {
  final int resolved;
  final int pending;
  final int review;

  const BusinessHomePage({
    super.key,
    required this.resolved,
    required this.pending,
    required this.review,
  });

  @override
  State<BusinessHomePage> createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
  // AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final int total = widget.pending + widget.resolved + widget.review;
    FirebaseAuth auth = FirebaseAuth.instance;
    String name = auth.currentUser?.displayName ?? "";
    return Scaffold(
      backgroundColor: color4,
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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatsCard(
                          title: 'Resolved',
                          val: widget.resolved,
                          color: Colors.green,
                        ),
                        StatsCard(
                          title: 'Pending',
                          val: 2,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatsCard(
                          title: 'Review',
                          val: widget.review,
                          color: color2,
                        ),
                        StatsCard(
                          title: 'Total',
                          val: 2,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MyPieChart(
                resolved: 0,
                pending: 2,
                review: 0,
              ),
            ],
          )),
    );
  }
}
