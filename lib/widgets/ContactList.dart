import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class ContactList extends StatelessWidget {
  final List<User> onlineUsers;

  ContactList({required this.onlineUsers});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              )),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final User user = onlineUsers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(user: user),
                );
              },
              itemCount: onlineUsers.length,
            ),
          )
        ],
      ),
    );
  }
}
