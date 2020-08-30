import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/search_screen.dart';
import '../widgets/badge.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    ProducrsOverviewScreen(),
    SearchScreen(),
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
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearh());
              },
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Consumer<CartProvider>(
                  builder: (_, cart, __) => cart.itemCount > 0
                      ? Badge(
                          child: Icon(Icons.shopping_cart),
                          color: Colors.amber,
                          value: cart.itemCount.toString())
                      : Icon(Icons.shopping_cart),
                ),
                label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
        ),
        body: _screens[_selectedIndex]);
  }
}

class DataSearh extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProductProvider> _items = [
      ProductProvider(
        id: 'p1',
        title: 'Red Shirt',
        description:
            'A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red!A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! \n A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red!A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red! A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p5',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p6',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p7',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        rating: 0,
      ),
      ProductProvider(
        id: 'p8',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        rating: 0,
      )
    ];

    List<ProductProvider> filteredItems = _items
        .where(
          (element) =>
              element.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.shopping_bag),
        title: query.length > 0
            ? RichText(
                text: TextSpan(
                  text: filteredItems[index].title.substring(0, query.length),
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(
                        text:
                            filteredItems[index].title.substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              )
            : Text(
                filteredItems[index].title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
        onTap: () {
          Navigator.of(context).pushNamed(
            '/product-details',
            arguments: filteredItems[index].id,
          );
        },
      ),
      itemCount: filteredItems.length,
    );
  }
}
