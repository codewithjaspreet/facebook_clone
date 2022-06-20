import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Stories extends StatelessWidget {
  Stories({required this.stories, required this.currentUser});

  final User currentUser;
  final List<Story> stories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  story: stories[0],
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
                story: story,
                currentUser: currentUser,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  _StoryCard(
      {this.isAddStory = false,
      required this.story,
      required this.currentUser});

  final bool isAddStory;
  User currentUser;
  Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.add,
                      ),
                      iconSize: 30,
                      color: Palette.facebookBlue,
                      onPressed: () {},
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                    isBorder: !story.isViewed,
                  )),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? 'Add to Story' : story.user.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
