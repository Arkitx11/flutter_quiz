import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/providers/navigaton_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(builder: (context, navigationProvider, child) => BottomBarDoubleBullet(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      selectedIndex: navigationProvider.index,
      onSelect: (int index) {
        navigationProvider.onSelect(index);
      },
      items: [
        BottomBarItem(
          iconData: Icons.home,
        ),
        BottomBarItem(
          iconData: Icons.scoreboard,
        ),
        BottomBarItem(
          iconData: Icons.info,
        ),
      ],
    ));
  }
}
