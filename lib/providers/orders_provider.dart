import 'package:flutter/foundation.dart';
import '../providers/cart_provider.dart';

class OrderItem with ChangeNotifier {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  bool isShipped;
  bool isExpanded;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime,
      this.isShipped = false,
      this.isExpanded = false});

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder({List<CartItem> cartProducts, double total}) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProducts));
  }

  void toggleShipped(String orderId) {
    final OrderItem order = _orders.firstWhere((order) => order.id == orderId);
    order.isShipped = !order.isShipped;
  }

  void toggleExpanded(String orderId) {
    final OrderItem order = _orders.firstWhere((order) => order.id == orderId);
    order.isExpanded = !order.isExpanded;
    notifyListeners();
  }
}
