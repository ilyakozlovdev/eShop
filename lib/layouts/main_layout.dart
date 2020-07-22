import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../widgets/badge.dart';
import 'package:eShop/providers/cart_provider.dart';
import 'package:eShop/screens/profile_screen.dart';
import '../screens/cart_screen.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    ProducrsOverviewScreen(),
    Center(
      child: Text(
        'Search Screen',
      ),
    ),
    CartScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Consumer<CartProvider>(
                  builder: (_, cart, __) => cart.itemCount > 0
                      ? Badge(
                          child: Icon(Icons.shopping_cart),
                          color: Colors.amber,
                          value: cart.itemCount.toString())
                      : Icon(Icons.shopping_cart),
                ),
                title: Text('Cart')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
        ),
        body: _screens[_selectedIndex]);
  }
}
