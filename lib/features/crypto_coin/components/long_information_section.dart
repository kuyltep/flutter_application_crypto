import 'package:flutter/material.dart';

class CoinLongInformationSection extends StatelessWidget {
  const CoinLongInformationSection(
      {super.key, required this.title, required this.value});
  final String title;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 29, 32, 41),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "$value\$",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ]));
  }
}
