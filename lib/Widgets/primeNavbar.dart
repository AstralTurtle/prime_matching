import 'package:flutter/material.dart';

import 'package:prime_matching/pages/Game/gamePage.dart';
import 'package:prime_matching/pages/Game/leaderboard.dart';
import 'package:prime_matching/pages/Admin/adminPage.dart';

class PrimeNavbar extends StatefulWidget {
  const PrimeNavbar({super.key});

  @override
  State<PrimeNavbar> createState() => _PrimeNavbarState();
}

class _PrimeNavbarState extends State<PrimeNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad),
          label: 'Game',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings),
          label: 'Admin',
        ),
      ],
    );
  }
}