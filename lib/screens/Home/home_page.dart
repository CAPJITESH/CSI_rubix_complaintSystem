import 'package:complaint_management/auth/auth.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Home/pie_chart.dart';
import 'package:complaint_management/screens/Home/stats_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final int resolved;
  final int pending;
  final int review;

  const HomePage({
    super.key,
    required this.resolved,
    required this.pending,
    required this.review,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final int total = widget.pending + widget.resolved + widget.review;
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color4,
        title: const Text(
              'Welcome Ritesh !',
              style: TextStyle(
                fontSize: 30,
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
                borderRadius: BorderRadius.circular(20)
              ),
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
                      StatsCard(title: 'Resolved', val: widget.resolved, color: Colors.green,),
                      StatsCard(title: 'Pending', val: widget.pending, color: Colors.brown,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCard(title: 'Review', val: widget.review, color: color2,),
                      StatsCard(title: 'Total', val: total, color: Colors.pink,),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            MyPieChart(
              resolved: widget.resolved,
              pending: widget.pending,
              review: widget.review,
            ),
          ],
      )),
    );
  }
}
