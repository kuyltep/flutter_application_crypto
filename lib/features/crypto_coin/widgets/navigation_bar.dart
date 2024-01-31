import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: pageIndex,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed("/");
            break;
          case 1:
            Navigator.of(context).pushNamed("/convertation");
            break;
          case 2:
            Navigator.of(context).pushNamed("/notes");
            break;
          case 3:
            Navigator.of(context).pushNamed("/profile");
          default:
        }
      },
      backgroundColor: const Color.fromARGB(255, 253, 176, 24),
      indicatorColor: Colors.white,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Main',
        ),
        NavigationDestination(
          icon: Icon(Icons.compare_arrows_outlined),
          label: 'Convertation',
        ),
        NavigationDestination(
          icon: Icon(Icons.note_alt),
          label: 'Notes',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_box),
          label: 'Profile',
        ),
      ],
    );
  }
}
