import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<Products>(context);
    final loadProducts =
        showFav == true ? ProductsData.favoriteItems : ProductsData.items;
    print(loadProducts, );
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadProducts.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // create: (c) => loadProducts[i],
        value: loadProducts[i],
        child: ProductItem(
            // loadProducts[i].id,
            // loadProdu cts[i].title,
            // loadProducts[i].imageUrl,
            // loadProducts[i].price
            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
