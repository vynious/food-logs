// chat_card.dart

import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.groupName,
    required this.isRemovable,
  }) : super(key: key);

  final String groupName;
  final bool isRemovable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(groupTitle: groupName),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 80.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          child: Stack(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                ),
                title: Text(groupName),
                subtitle: Text(
                  'Last message',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Text(
                  '10:30 AM',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
