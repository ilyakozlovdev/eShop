import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';

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
    Center(
      child: Text(
        'Shopping Cart',
      ),
    ),
    Center(
      child: Text(
        'Profile',
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => null,
            )
          ],
          title: Row(
            children: [
              Icon(Icons.blur_linear),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text('eShop'),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text('Cart')),
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
