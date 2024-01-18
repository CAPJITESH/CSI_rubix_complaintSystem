import 'package:complaint_management/screens/View%20Complaints/complaint_card.dart';
import 'package:flutter/material.dart';

class ViewComplaints extends StatefulWidget {
  const ViewComplaints({super.key});

  @override
  State<ViewComplaints> createState() => _ViewComplaintsState();
}

class _ViewComplaintsState extends State<ViewComplaints> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComplaintCard(),
        ComplaintCard(),
      ],
    );
  }
}
