import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/orders_provider.dart' as ord;
import '../../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final List<ord.OrderItem> orders =
        Provider.of<ord.OrdersProvider>(context).orders;
    final List<ord.OrderItem> shipped =
        orders.where((order) => order.isShipped == true).toList();
    final List<ord.OrderItem> inProgress =
        orders.where((order) => order.isShipped == false).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My orders'),
          bottom: TabBar(
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'In progress',
              ),
              Tab(
                text: 'Shipped',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(inProgress[i]),
              itemCount: inProgress.length,
            ),
            ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(shipped[i]),
              itemCount: shipped.length,
            ),
          ],
        ),
      ),
    );
  }
}
