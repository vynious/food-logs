import 'package:flutter/material.dart';


class GroupSectionWidget extends StatelessWidget {
  const GroupSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DecoratedBox(
        decoration:
        const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0), // Adjust the padding as needed
          child: Row(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'groups',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()), // Empty space to expand and push the button to the right
              ElevatedButton(
                onPressed: () {
              //     Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => NewPage()),
              // );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10.0),
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0.0),
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
