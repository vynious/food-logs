// chat_screen.dart

import 'package:flutter/material.dart';
import 'components/checklist_item.dart';

class ChatScreen extends StatefulWidget {
  final String groupTitle;

  const ChatScreen({Key? key, required this.groupTitle}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<bool> checkedItems = List.generate(5, (index) => false);
  int itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupTitle),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ChecklistItem(
              itemText: 'Item $index',
              isChecked: checkedItems[index],
              onChanged: (value) {
                setState(() {
                  checkedItems[index] = value!;
                });
              },
              backgroundColor:
                  checkedItems[index] ? Colors.grey[700]! : Colors.white,
              senderName: 'Sender Name',
              senderProfilePicture: '../assets/samplepic.png',
              tags: ['Tag1', 'Tag2', 'Tag3'],
              cardImage: '../assets/samplepic.png',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            itemCount++;
            checkedItems.add(false);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
