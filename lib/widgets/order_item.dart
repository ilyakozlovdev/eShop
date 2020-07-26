import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart' as op;

class OrderItem extends StatelessWidget {
  final op.OrderItem order;

  const OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<op.OrdersProvider>(context);

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                order.isShipped ? Icon(Icons.archive) : Icon(Icons.unarchive)
              ],
            ),
            title: Text(
                'Order #${order.id.substring(order.id.length - 6).trim()}'),
            subtitle:
                Text(DateFormat('dd.MM.yyyy hh:mm').format(order.dateTime)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: () => ordersProvider.toggleExpanded(order.id),
                )
              ],
            ),
          ),
          order.isExpanded
              ? Container(
                  child: Column(
                    children: [
                      ...order.products.map((product) => Row(
                            children: [
                              Text(product.title),
                              Text(product.price.toString())
                            ],
                          ))
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
