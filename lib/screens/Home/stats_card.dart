import 'package:flutter/material.dart';
import '../../constants.dart';

class StatsCard extends StatelessWidget {
  final int val;
  final String title;
  final Color color;

  const StatsCard({
    super.key,
    required this.title,
    required this.val,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
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
    );
  }
}