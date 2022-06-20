import 'package:facebook_clone/palette.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(onPressed: () {}, icon: Icons.search, iconSize: 30),
              CircleButton(
                  onPressed: () {},
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30),
            ],
          )
        ],
      ),
    );
  }
}