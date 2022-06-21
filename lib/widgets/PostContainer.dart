import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/palette.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  PostContainer({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDeskTop = Responsive.isDeskTop(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: isDeskTop ? 5 : 0),
      elevation: isDeskTop ? 1 : 0,
      shape: isDeskTop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    post.caption,
                  ),
                  post.imageUrl != ""
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        ),
                ],
              ),
            ),
            post.imageUrl != ""
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  PostHeader({required this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey,
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  PostStats({required this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Like',
                onTap: () => {}),
            PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Comment',
                onTap: () => {}),
            PostButton(
                icon: Icon(
                  MdiIcons.share,
                  color: Colors.grey[600],
                  size: 25,
                ),
                label: 'Share',
                onTap: () => {}),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;

  PostButton({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon, const SizedBox(width: 4), Text(label)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
