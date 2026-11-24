import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_color.dart';
import 'package:movies/modules/layout/layout_screens/browse_screen.dart';
import 'package:movies/modules/layout/layout_screens/home_screen.dart';
import 'package:movies/modules/layout/layout_screens/profile_screen.dart';
import 'package:movies/modules/layout/layout_screens/search_screen.dart';

class LayoutScreen extends StatefulWidget {
  static String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

int index = 0;

List<Widget> screens = [
  HomeScreen(),
  SearchScreen(),
  BrowseScreen(),
  ProfileScreen()
];

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        color: Colors.green,
        margin: EdgeInsetsGeometry.all(16),
        height: 64,
        width: double.infinity,
        child: BottomNavigationBar(


          currentIndex: index,
          iconSize: 24,
          onTap: (value) {
            index = value;
            print(index);
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "",
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
