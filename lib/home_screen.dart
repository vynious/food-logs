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
  List<String> filteredGroups = [];

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

  void filterGroups(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredGroups.clear();
      });
    } else {
      setState(() {
        filteredGroups = groups
            .where((group) => group.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  Widget buildSearchBar() {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 8.0),
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 20.0,
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isCollapsed: true,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: filterGroups,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGroupList() {
    final groupsToShow = filteredGroups.isNotEmpty ? filteredGroups : groups;

    if (groupsToShow.isEmpty) {
      return ListView();
    }

    return ListView.builder(
      itemCount: groupsToShow.length + 3, // Add 3 for Personal Chat card, header, and "Add Group" button
      itemBuilder: (context, index) {
        if (index == 0) {
          return ChatCard(
            groupName: 'Personal Chat',
            isRemovable: false,
          );
        } else if (index == 1) {
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
        } else if (index == 2) {
          // Line separator under "Groups" header
          return Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.black,
          );
        } else {
          final group = groupsToShow[index - 3];
          return Dismissible(
            key: Key(group),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => removeGroup(index - 3),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Column(
              children: [
                ChatCard(
                  groupName: group,
                  isRemovable: true,
                ),
                if (index == groupsToShow.length + 2) SizedBox(height: 16.0), // Add spacing after the last group
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: buildSearchBar(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0), // Add spacing before the group list
          Expanded(child: buildGroupList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addGroup,
        child: const Icon(Icons.add),
      ),
    );
  }
}
