import 'package:flutter_application_1/features/bar_chart/individual_bar.dart';

class BarData {
  BarData({
    required this.firstData,
    required this.secondData,
    required this.currentData,
  });
  final double firstData;
  final double secondData;
  final double currentData;
  List<IndividualBar> barData = [];
  void initializeBarData() {
    barData = [
      IndividualBar(x: 1, y: firstData),
      IndividualBar(x: 2, y: secondData),
      IndividualBar(x: 3, y: currentData),
    ];
  }
}
