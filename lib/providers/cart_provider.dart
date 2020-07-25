import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
      @required this.imageUrl});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void toggleItem({
    String productId,
    double price,
    String title,
    String imageUrl,
  }) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: productId,
              price: price,
              title: title,
              quantity: 1,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void incItemQuantity(String productId) {
    _items.update(
        productId,
        (cartItem) => CartItem(
            id: cartItem.id,
            imageUrl: cartItem.imageUrl,
            price: cartItem.price,
            quantity: cartItem.quantity + 1,
            title: cartItem.title));
    notifyListeners();
  }

  void decItemQuantity(String productId) {
    _items.update(
        productId,
        (cartItem) => CartItem(
            id: cartItem.id,
            imageUrl: cartItem.imageUrl,
            price: cartItem.price,
            quantity: cartItem.quantity > 0 ? cartItem.quantity - 1 : 0,
            title: cartItem.title));
    notifyListeners();
  }
}
