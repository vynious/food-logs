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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: Card(
              color: backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    cardImage,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      itemText,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
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
                                children: tags
                                    .map(
                                      (tag) => Chip(
                                        label: Text(
                                          tag,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
