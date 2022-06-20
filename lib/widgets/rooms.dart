import 'package:facebook_clone/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Room extends StatelessWidget {
  Room({required this.onlineUsers});

  final List onlineUsers;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreateRoomButoon(),
              );
            }
            ;
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
          itemCount: 1 + onlineUsers.length,
        ));
  }
}

class _CreateRoomButoon extends StatelessWidget {
  const _CreateRoomButoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (OutlinedButton(
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text('Create\nRoom')
        ],
      ),
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(color: Palette.facebookBlue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.blueAccent[100]!, width: 3),
      ),
    ));
  }
}
