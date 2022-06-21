import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/user_model.dart';
import 'UserCard.dart';

class MoreOptions extends StatelessWidget {
  final List<List> moreOptionList = [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  final User CurrentUser;
  MoreOptions({Key? key, required this.CurrentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: UserCard(user: currentUser),
            );
          }

          final List option = moreOptionList[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Option(icon: option[0], color: option[1], label: option[2]),
          );
        },
        itemCount: moreOptionList.length,
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option(
      {Key? key, required this.icon, required this.color, required this.label})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: color,
          ),
          SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
