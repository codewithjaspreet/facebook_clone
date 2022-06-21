import 'package:facebook_clone/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar(
      {required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  @override
  Widget build(BuildContext context) {
    // mapping all the icons using this method
    // creates tab bar on the bottom of the screen
    return TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            border: isBottomIndicator
                ? Border(
                    bottom: BorderSide(color: Palette.facebookBlue, width: 3))
                : Border(
                    top: BorderSide(color: Palette.facebookBlue, width: 3))),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      e,
                      color: i == selectedIndex
                          ? Palette.facebookBlue
                          : Colors.black45,
                      size: 30,
                    ),
                  ),
                ))
            .values
            .toList());
  }
}
