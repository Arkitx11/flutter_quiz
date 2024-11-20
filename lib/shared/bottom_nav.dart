import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  final int navigationIndex;
  final Function(int) onSelectingNavigation;
  const BottomNavBar({super.key, required this.navigationIndex, required this.onSelectingNavigation});

  @override
  Widget build(BuildContext context) {
    return BottomBarDoubleBullet(backgroundColor: Theme.of(context).secondaryHeaderColor,
        selectedIndex: navigationIndex,
        onSelect: onSelectingNavigation,

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
        ]);
  }
}