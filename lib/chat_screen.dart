import 'package:flutter/material.dart';
import 'components/checklist_item.dart';

class ChatScreen extends StatefulWidget {
  final String groupTitle;

  const ChatScreen({Key? key, required this.groupTitle}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

enum FilterOption {
  checkedOff,
  notCheckedOff,
}

class _ChatScreenState extends State<ChatScreen> {
  List<bool> checkedItems = List.generate(5, (index) => false);
  int itemCount = 5;

  FilterOption filterOption = FilterOption.checkedOff;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildChatBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        widget.groupTitle,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        buildFilterIconButton(
          Icons.check_box,
          FilterOption.checkedOff,
        ),
        buildFilterIconButton(
          Icons.check_box_outline_blank,
          FilterOption.notCheckedOff,
        ),
      ],
    );
  }

  IconButton buildFilterIconButton(IconData icon, FilterOption option) {
    final isSelected = filterOption == option;
    return IconButton(
      onPressed: () {
        setState(() {
          filterOption = option;
        });
      },
      icon: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget buildChatBody() {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final isVisible = filterOption == FilterOption.checkedOff
              ? checkedItems[index]
              : !checkedItems[index];
          return Visibility(
            visible: isVisible,
            child: buildChecklistItem(index),
          );
        },
      ),
    );
  }

  Widget buildChecklistItem(int index) {
    return ChecklistItem(
      itemText: 'Item $index',
      isChecked: checkedItems[index],
      onChanged: (value) {
        setState(() {
          checkedItems[index] = value!;
        });
      },
      backgroundColor: checkedItems[index] ? Colors.grey[400]! : Colors.white,
      senderName: 'Sender Name',
      senderProfilePicture: '../assets/samplepic.png',
      tags: ['Tag1', 'Tag2', 'Tag3'],
      cardImage: '../assets/samplepic.png',
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          itemCount++;
          checkedItems.add(false);
        });
      },
      backgroundColor: Colors.grey[500],
      child: Icon(Icons.add),
    );
  }
}
