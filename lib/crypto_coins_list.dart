import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/route.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CryptoCoinsList extends StatelessWidget {
  const CryptoCoinsList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      theme: darkTheme,
      routes: routes,
    );
  }
}
