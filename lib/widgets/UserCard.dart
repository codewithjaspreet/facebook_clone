import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileAvatar(imageUrl: user.imageUrl),
        const SizedBox(
          width: 6,
        ),
        Flexible(
          child: Text(
            user.name,
            style:
                const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }
}
