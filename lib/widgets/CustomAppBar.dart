import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../palette.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final bool isBottomIndicator;
  final List<IconData> icons;
  final Function(int) onTap;
  final int index;
  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      this.isBottomIndicator = true,
      required this.icons,
      required this.index,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            width: 600,
            height: double.infinity,
            child: CustomTabBar(
              isBottomIndicator: true,
              icons: icons,
              selectedIndex: index,
              onTap: (int) {},
            ),
          ),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(
                width: 12,
              ),
              CircleButton(onPressed: () {}, icon: Icons.search, iconSize: 30),
              CircleButton(
                  onPressed: () {},
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30),
            ],
          ))
        ],
      ),
    );
  }
}
