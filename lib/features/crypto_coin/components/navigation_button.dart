import 'package:flutter/material.dart';

class CoinScreenNavigationButton extends StatelessWidget {
  const CoinScreenNavigationButton(
      {super.key, required this.buttonText, required this.buttonRoute});
  final String buttonText;
  final String buttonRoute;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(buttonRoute);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade700),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child:
              Text(buttonText, style: Theme.of(context).textTheme.bodyMedium),
        ));
  }
}
