import 'package:facebook_clone/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_clone/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    Home(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: index,
          children: screens,
        ),
        // more better option can be indexed stack , as even
        // after the scrolling the index stack maintains the scrollable position
        // of the previous tab
        // body: TabBarView(
        //   children: screens,
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
            icons: icons,
            selectedIndex: index,
            onTap: (index) => setState(() => index = index),
          ),
        ),
      ),
    );
  }
}
