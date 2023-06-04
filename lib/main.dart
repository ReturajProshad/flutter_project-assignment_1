import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  int _currentIndex = 0;
  final List<Widget> pages = [
    Page(color: Colors.blue, number: '1', floatinColor: Colors.pink),
    Page(color: Colors.orange, number: '2', floatinColor: Colors.brown),
    Page(color: Colors.green, number: '3', floatinColor: Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.pink,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page One"),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: "Page two"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp), label: "Page three")
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Returaj's Drawer")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Page 1"),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text("Page 2"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit_sharp),
              title: Text("Page 3"),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Color color;
  final String number;
  final Color floatinColor;
  const Page(
      {required this.color, required this.number, required this.floatinColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(
          number,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: floatinColor,
          child: Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
