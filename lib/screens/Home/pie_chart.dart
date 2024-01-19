import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {

  final int resolved;
  final int pending;
  final int review;

  const MyPieChart({
    super.key,
    required this.resolved,
    required this.pending,
    required this.review,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
                value: pending.toDouble(),
                color: Colors.amber,
                radius: 120,
                title: 'Pending',
                titleStyle: const TextStyle(fontSize: 18)
            ),
            PieChartSectionData(
                value: resolved.toDouble(),
                color: Colors.green,
                radius: 120,
                title: 'Resolved',
                titleStyle: const TextStyle(fontSize: 18)
            ),
            PieChartSectionData(
                value: review.toDouble(),
                color: Colors.deepPurpleAccent[50],
                radius: 120,
                title: 'Review',
                titleStyle: const TextStyle(fontSize: 18)
            ),
          ],
          centerSpaceRadius: 0,
        ),
      ),
    );
  }
}