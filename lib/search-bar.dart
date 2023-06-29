import 'package:flutter/material.dart';


class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const SearchBarWidget({super.key, 
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 32,
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0), // Adjust the padding
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12.0), // Adjust the font size
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15), // Adjust the content padding
          hintText: 'search food or groups',
          suffixIcon: Icon(Icons.search, size: 12,) ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        onChanged: onSearch,
      ),
    );
  }
}

