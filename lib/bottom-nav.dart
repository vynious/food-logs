import 'package:flutter/material.dart';


class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.grey[200],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30,),
          Icon(Icons.settings, size: 30,),
        ],
      ),
    );
  }
}


