import 'package:flutter/material.dart';
import 'add-groups/add-groups.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MyApp({super.key});

  void handleSearch(String query) {
    // Perform search logic here
    print('Searching for: $query');
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
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0), // Adjust the padding as needed
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
          SizedBox(height: 2.0), // Adjust the height as needed
          SearchBarWidget(
            controller: _controller,
            onSearch: handleSearch,
          ),
  
          SizedBox(height: 10.0), // Empty space between the SearchBarWidget and other widgets
          const BigBoxWidget(
            header: 'my list',
            height: 150.0,
            child: Text('my lists ~'),
          ),
         // ADD
          SizedBox(height: 2.0),
          GroupSectionWidget(
            
          ),// Adjust the height as needed

          SizedBox(height: 8.0), // Adjust the height as needed
          const BigBoxWidget(
            header: 'my groups',
            height: 200.0,
            child: Text('my groups ~'),
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget(),
    ),
  );
}}
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

class BigBoxWidget extends StatelessWidget {
  final String header;
  final Widget child;
  final double height;

  const BigBoxWidget({
    Key? key,
    required this.header,
    required this.child,
    this.height = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}



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


class GroupSectionWidget extends StatelessWidget {
  const GroupSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
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
              Align(
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
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPage()),
              );
                },
                child: Icon(Icons.add, color: Colors.black, size: 15),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10.0),
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
