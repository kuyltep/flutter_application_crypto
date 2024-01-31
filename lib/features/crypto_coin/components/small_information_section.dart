import 'package:flutter/material.dart';

class CoinSmallInformationSection extends StatelessWidget {
  const CoinSmallInformationSection(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 29, 32, 41),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text("$title${value}",
            style: Theme.of(context).textTheme.bodyMedium));
  }
}
