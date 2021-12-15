import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'trending.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> select = [
      const Home(),
      const Trending(),
      const Profile(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Application",
          style: TextStyle(color: Colors.purple),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dehaze),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: select[value],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          currentIndex: value,
          onTap: (index) {
            setState(() {
              value = index;
            });
          },
          items: const [
            BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "trending", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "profile", icon: Icon(Icons.person_rounded)),
          ]),
    );
  }
}
