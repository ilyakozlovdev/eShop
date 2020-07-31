import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders_provider.dart' as op;

class OrderItem extends StatefulWidget {
  final op.OrderItem order;

  const OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;
  double _totalAmount = 0;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _totalAmountCalculator() {
    _totalAmount = 0;
    widget.order.products.forEach((product) {
      _totalAmount += product.price * product.quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    _totalAmountCalculator();
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.order.isShipped
                    ? Icon(Icons.archive)
                    : Icon(Icons.unarchive)
              ],
            ),
            title: Text(
                'Order #${widget.order.id.substring(widget.order.id.length - 6).trim()}'),
            subtitle: Text(
                DateFormat('dd.MM.yyyy hh:mm').format(widget.order.dateTime)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: _toggleExpand,
                )
              ],
            ),
          ),
          _isExpanded
              ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: Column(
                        children: [
                          ...widget.order.products.map((product) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${product.title} x${product.quantity.toString()}'),
                                  Text(
                                      '\$${(product.price * product.quantity).toStringAsFixed(2)}'),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.blueGrey.withOpacity(0.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Total: \$${_totalAmount.toStringAsFixed(2)}')
                        ],
                      ),
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
