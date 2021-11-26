import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework_challenge/features/home/utils/navigation_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _padding = 16.0;
    var _navigationList = NavigationList().list;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: _navigationList[_selectedIndex].body,
        ),
      ),
      bottomNavigationBar: _bottomBar(_navigationList),
    );
  }

  _bottomBar(List<NavigationListObject> _navigationList) {
    return BottomNavigationBar(
      items: _navigationList.map((item) {
        return item.bottomNavigationBarItem;
      }).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      onTap: _onItemTapped,
    );
  }
}
