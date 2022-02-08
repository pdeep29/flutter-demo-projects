import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_poduct_screen.dart';
import '../widgets/app_widget.dart';
import '../widgets/user_product_item.dart';

import '../providers/products.dart';

class UserProdyctsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).FetchAnsSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<Products>(context);
    // print(ProductsData);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                    ProductsData.items[i].id,
                    ProductsData.items[i].title,
                    ProductsData.items[i].imageUrl),
                Divider(),
              ],
            ),
            itemCount: ProductsData.items.length,
          ),
        ),
      ),
    );
  }
}
