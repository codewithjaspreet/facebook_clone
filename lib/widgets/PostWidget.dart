import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class PostWidget extends StatelessWidget {
  PostWidget({required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    final bool isDeskTop = Responsive.isDeskTop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDeskTop ? 5 : 0),
      elevation: isDeskTop ? 1 : 0,
      shape: isDeskTop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                  VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo')),
                  VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Live')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
