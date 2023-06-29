import 'package:flutter/material.dart';


class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/activity1.png", width: 30, height: 30),
          Image.asset("assets/plus3.png", width: 30, height: 30),
          Image.asset("assets/settings1.png", width: 30, height: 30),
        ],
      ),
    );
  }
}


