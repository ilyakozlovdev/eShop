import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  bool isFavorite;
  bool isInCart;

  ProductProvider(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      @required this.rating,
      this.isFavorite = false,
      this.isInCart = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleInCart() {
    isInCart = !isInCart;
    notifyListeners();
  }

  void removeFromCart() {
    isInCart = false;
    notifyListeners();
  }
}
