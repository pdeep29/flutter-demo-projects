import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_widget.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_items.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero).then((_) async {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();

    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    // // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future:
                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            builder: (ctx, dataSnapShot) {
              if (dataSnapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: const CircularProgressIndicator(),
                );
              } else if (dataSnapShot.error != null) {
                return const Center(
                  child: Text(' Encountered An Error!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                    itemCount: orderData.orders.length,
                  ),
                );
              }
            })
        // _isLoading
        //     ? const Center(
        //         child: const CircularProgressIndicator(),
        //       )
        //     : ListView.builder(
        //         itemBuilder: (ctx, i) => OrderItem(orders.orders[i]),
        //         itemCount: orders.orders.length,
        //       ),
        );
  }
}
