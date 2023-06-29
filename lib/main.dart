import 'package:flutter/material.dart';
import 'bottom-nav.dart';
import 'group-section.dart';
import 'search-bar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MyApp({super.key});

  void handleSearch(String query) {
    // Perform search logic here

  }

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('FoodLog'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'hi shawn :)',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 2.0), 
          SearchBarWidget(
            controller: _controller,
            onSearch: handleSearch,
          ),
  
         
         // ADD
          const SizedBox(height: 2.0),
          const GroupSectionWidget(),
        ],
      ),
      bottomNavigationBar: const BottomWidget(),
    ),
  );
}}

