import 'package:flutter/material.dart';
import 'product_provider.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductProvider> _items = [
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
    ),
  ];

  List<ProductProvider> get items {
    return [..._items];
  }

  ProductProvider findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void removeAllFromCart() {
    _items.forEach((product) => product.isInCart = false);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
