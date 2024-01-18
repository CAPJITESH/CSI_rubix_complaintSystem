import 'package:complaint_management/constants.dart';
import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color4,
      ),
    );
  }
}