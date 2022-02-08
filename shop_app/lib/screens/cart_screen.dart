import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        // zedBox(
                        //   width: 10,
                        // ),Si
                        Chip(
                          label: Text(
                            '\$${cart.totalAmount}',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        TextButton(
                            onPressed: cart.totalAmount <= 0
                                ? null
                                : () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await Provider.of<Orders>(context,
                                            listen: false)
                                        .addOrders(cart.items.values.toList(),
                                            cart.totalAmount);
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    cart.clear();
                                  },
                            child: Text("Order Now",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (ctx, i) => CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.values.toList()[i].title,
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.keys.toList()[i]),
                  itemCount: cart.items.length,
                ))
              ],
            ),
    );
  }
}
// CartItems(
//                 id: cart.items[i].id,
//                 title: cart.items[i].title,
//                 quantity: cart.items[i].quantity,
//                 price: cart.items[i].price),