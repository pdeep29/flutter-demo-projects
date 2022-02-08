import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_widget.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _intState = true;
  var _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_intState) {
      setState(() {
        _isLoading = !_isLoading;
      });
      print(_isLoading);

      // TODO: implement didChangeDependencies
      Provider.of<Products>(context).FetchAnsSetProducts().then((value) {
        setState(() {
          _isLoading = !_isLoading;
        });
      });
      print(_isLoading);
    }
    ;
    _intState = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, __) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              color: Colors.red,
              value: cart.itemCount.toString(),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  // productsContainer.showFavoriteOnly();
                  print('_showOnlyFavorites true');
                  _showOnlyFavorites = true;
                } else {
                  print('_showOnlyFavorites false');
                  _showOnlyFavorites = false;
                  // productsContainer.showAll();
                }
              });
            },
            icon: const Icon(Icons.filter_list_alt),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  child: Text('Favoriote'), value: FilterOptions.Favorites),
              const PopupMenuItem(
                  child: Text('Show All'), value: FilterOptions.all),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: !_isLoading
          ? ProductsGrid(_showOnlyFavorites)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
