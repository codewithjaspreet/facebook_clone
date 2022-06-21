import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home.dart';
import 'package:facebook_clone/widgets/responsive.dart';
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
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar: Responsive.isDeskTop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child: CustomAppBar(
                  onTap: (index) => setState(() => index = index),
                  currentUser: currentUser,
                  icons: icons,
                  index: index,
                ),
              )
            : null,
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
        bottomNavigationBar: !Responsive.isDeskTop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTabBar(
                  icons: icons,
                  selectedIndex: index,
                  onTap: (index) => setState(() => index = index),
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
