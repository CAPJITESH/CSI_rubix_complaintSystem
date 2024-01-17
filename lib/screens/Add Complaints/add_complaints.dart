import 'package:flutter/material.dart';

class AddComplaints extends StatefulWidget {
  const AddComplaints({super.key});

  @override
  State<AddComplaints> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends State<AddComplaints> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Add Complaints"),
    );
  }
}
