// checklist_item.dart
import 'package:flutter/material.dart';

class ChecklistItem extends StatelessWidget {
  const ChecklistItem({
    Key? key,
    required this.itemText,
    required this.isChecked,
    required this.onChanged,
    required this.backgroundColor,
    required this.senderName,
    required this.senderProfilePicture,
    required this.tags,
    required this.cardImage,
  }) : super(key: key);

  final String itemText;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final Color backgroundColor;
  final String senderName;
  final String senderProfilePicture;
  final List<String> tags;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: backgroundColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: buildCard(),
          ),
        ),
      ],
    );
  }

  Widget buildCard() {
    return Card(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildItemText(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildSenderInfo(),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      cardImage,
      fit: BoxFit.cover,
    );
  }

  Widget buildItemText() {
    return Text(
      itemText,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildSenderInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(senderProfilePicture),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                senderName,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: buildTags(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> buildTags() {
    return tags.map(
      (tag) => Chip(
        label: Text(
          tag,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    ).toList();
  }
}
