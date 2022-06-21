import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/palette.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/PostContainer.dart';
import 'package:facebook_clone/models/models.dart';

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
          ),
          SliverToBoxAdapter(
            child: PostWidget(user: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Room(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
