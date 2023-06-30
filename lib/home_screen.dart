import 'package:flutter/material.dart';
import 'chat_card.dart';
import 'custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> groups = [
    'Personal Chat',
    'Group 1',
    'Group 2',
    'Group 3',
  ];

  void addGroup() {
    setState(() {
      groups.add('Group ${groups.length + 1}');
    });
  }

  void removeGroup(int index) {
    if (index == 0) {
      // Do not remove the personal chat card
      return;
    }
    setState(() {
      groups.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: groups.length + 2,
        separatorBuilder: (context, index) {
          if (index == 1) {
            // Separator after personal chat card
            return const Divider(
              thickness: 1.0,
              height: 1.0,
              color: Colors.black,
              indent: 16.0,
              endIndent: 16.0,
            );
          }
          return const SizedBox();
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            // Personal chat card
            return ChatCard(
              groupName: 'Personal Chat',
              isRemovable: false,
            );
          } else if (index == 1) {
            // Header for group chats
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Groups',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            );
          } else if (index == groups.length + 1) {
            // Add Chat button
            return CustomButton(
              onPressed: addGroup,
              label: 'Create new group',
              backgroundColor: Colors.grey,
            );
          } else {
            // Group chat card
            final group = groups[index - 1];
            return Dismissible(
              key: Key(group),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => removeGroup(index - 1),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ChatCard(
                groupName: group,
                isRemovable: true,
              ),
            );
          }
        },
      ),
    );
  }
}
