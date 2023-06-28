import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      height: 80.0, // Updated height of the card
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: Stack(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with the actual profile picture
              ),
              title: Text(groupName),
              subtitle: Text(
                'Last message',
                style: TextStyle(
                  fontSize: 14.0, // Updated font size of the last message
                ),
              ),
            ),
            Positioned(
              top: 8.0, // Adjust the top position as needed
              right: 8.0, // Adjust the right position as needed
              child: Text(
                '10:30 AM', // Replace with the actual timestamp
                style: TextStyle(
                  fontSize: 12.0, // Updated font size of the timestamp
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
