import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
    required this.maxValue,
    required this.firstData,
    required this.secondData,
    required this.minValue,
    required this.currentData,
  });
  final double maxValue;
  final double minValue;
  final double firstData;
  final double secondData;
  final double currentData;
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      firstData: firstData,
      secondData: secondData,
      currentData: currentData,
    );
    myBarData.initializeBarData();
    return BarChart(BarChartData(
        minY: minValue,
        maxY: maxValue,
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottomsTitles))),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.yellow.shade700,
                      width: 20,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: maxValue,
                          show: true,
                          color: Colors.grey.shade400))
                ]))
            .toList()));
  }
}

Widget getBottomsTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text(
        "Low",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "High",
        style: style,
      );
      break;
    case 3:
      text = const Text("Now", style: style);
      break;
    default:
      text = const Text("", style: style);
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
