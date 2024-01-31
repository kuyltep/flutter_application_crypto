import 'package:flutter/material.dart';

import '../../bar_chart/bar_chart_widget.dart';

class CoinPriceChart extends StatelessWidget {
  const CoinPriceChart(
      {super.key,
      required this.priceInUSD,
      required this.highValue,
      required this.lowValue,
      required this.title});

  final double priceInUSD;
  final double highValue;
  final double lowValue;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 29, 32, 41),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )),
            BarChartWidget(
                currentData: priceInUSD,
                minValue: priceInUSD / 1.1,
                maxValue: highValue,
                firstData: lowValue,
                secondData: highValue)
          ],
        ));
  }
}
