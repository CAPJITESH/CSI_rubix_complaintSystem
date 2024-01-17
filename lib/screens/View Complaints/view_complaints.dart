import 'package:flutter/material.dart';

class ViewComplaints extends StatefulWidget {
  const ViewComplaints({super.key});

  @override
  State<ViewComplaints> createState() => _ViewComplaintsState();
}

class _ViewComplaintsState extends State<ViewComplaints> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("View complaits"),
    );
  }
}
