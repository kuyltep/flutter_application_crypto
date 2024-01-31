import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bar_chart/bar_graph.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
    required this.maxValue,
    required this.firstData,
    required this.secondData,
    required this.minValue,
    required this.currentData,
  });
  final double minValue;
  final double maxValue;
  final double firstData;
  final double secondData;
  final double currentData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: BarGraph(
        currentData: currentData,
        minValue: minValue,
        maxValue: maxValue,
        firstData: firstData,
        secondData: secondData,
      ),
    );
  }
}
