import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework_challenge/features/cart/presentation/pages/cart.dart';
import 'package:framework_challenge/features/feed/presentation/pages/feed.dart';

class NavigationListObject {
  Widget body;
  BottomNavigationBarItem bottomNavigationBarItem;

  NavigationListObject({
    required this.body,
    required this.bottomNavigationBarItem,
  });
}

class NavigationList {
  List<NavigationListObject> list = [
    NavigationListObject(
      body: const Feed(),
      bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag),
        label: 'Home',
      ),
    ),
    NavigationListObject(
      body: const Cart(),
      bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Carrinho',
      ),
    ),
  ];
}
