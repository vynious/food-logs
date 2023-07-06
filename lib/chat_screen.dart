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
      appBar: AppBar(
        title: Text(
          widget.groupTitle,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black), // Set title text color to black
        ),
        backgroundColor: Colors.grey[200], // Set backgroundColor to match the container color
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black), // Set icon color to black
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                filterOption = FilterOption.checkedOff;
              });
            },
            icon: Icon(
              Icons.check_box,
              color: filterOption == FilterOption.checkedOff ? Colors.black : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                filterOption = FilterOption.notCheckedOff;
              });
            },
            icon: Icon(
              Icons.check_box_outline_blank,
              color: filterOption == FilterOption.notCheckedOff ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            bool isVisible = filterOption == FilterOption.checkedOff ? checkedItems[index] : !checkedItems[index];
            return Visibility(
              visible: isVisible,
              child: ChecklistItem(
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
              ),
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 40.0,
        height: 40.0,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              itemCount++;
              checkedItems.add(false);
            });
          },
          backgroundColor: Colors.grey[500],
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
