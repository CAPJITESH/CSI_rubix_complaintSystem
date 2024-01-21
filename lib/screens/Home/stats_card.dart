import 'package:complaint_management/screens/View%20Complaints/view_complaints.dart';
import 'package:complaint_management/screens/View%20Complaints/view_complaints_by_type.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class StatsCard extends StatelessWidget {
  final int val;
  final String title;
  final Color color;
  final String nav;

  const StatsCard({
    super.key,
    required this.title,
    required this.val,
    required this.color,
    required this.nav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => nav == 'total'
                  ? ViewComplaints()
                  : ViewComplaintsByType(status: nav)),
        );
      },
      child: Container(
        width: 135,
        height: 90,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color4),
        child: Column(
          children: [
            Text(
              val.toString(),
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
