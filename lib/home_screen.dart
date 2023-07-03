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
  List<String> pinnedChats = ['Personal Chat'];
  List<String> groups = [
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
    setState(() {
      if (filteredGroups.isNotEmpty) {
        groups.remove(filteredGroups[index - pinnedChats.length]);
        filteredGroups.removeAt(index - pinnedChats.length);
      } else {
        groups.removeAt(index - pinnedChats.length);
      }
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
      itemCount: pinnedChats.length + groupsToShow.length + 1, // Add 1 for "Add Group" button
      itemBuilder: (context, index) {
        if (index == 0) {
          return ChatCard(
            groupName: pinnedChats[0],
            isRemovable: false,
          );
        } else if (index == pinnedChats.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity, // Make the underline span the entire width
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (index == pinnedChats.length + groupsToShow.length) {
          return CustomButton(
            onPressed: addGroup,
            label: 'Add Group Chat',
          );
        } else {
          final group = groupsToShow[index - pinnedChats.length];
          return Dismissible(
            key: Key(group),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => removeGroup(index - pinnedChats.length),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle home icon click
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications icon click
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings icon click
              },
            ),
          ],
        ),
      ),
    );
  }
}
