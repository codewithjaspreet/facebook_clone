import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/palette.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/PostContainer.dart';
import 'package:facebook_clone/models/models.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController trackingScrollController =
      TrackingScrollController();

  // tracking controller to avoid
  // re rendering of screen on size shrink
  // and the scrolling effect starts
  // from where it is supposed to rather than
  // re - building;
  @override
  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(
              trackingScrollController: trackingScrollController),
          desktop: HomeScreenDesktop(
              trackingScrollController: trackingScrollController),
          tablet: HomeScreenTablet(),
        ),
      ),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;
  const HomeScreenMobile({Key? key, required this.trackingScrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: trackingScrollController,
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
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const HomeScreenDesktop({Key? key, required this.trackingScrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptions(CurrentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          child: CustomScrollView(
            controller: trackingScrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
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
          width: 600,
          color: Colors.transparent,
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactList(onlineUsers: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
