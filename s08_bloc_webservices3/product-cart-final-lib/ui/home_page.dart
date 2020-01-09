import 'package:flutter/material.dart';
import 'package:s06webservicept2navigation/model/cart.dart';
import 'package:s06webservicept2navigation/model/product.dart';
import 'package:s06webservicept2navigation/ui/product_row_widget.dart';
import 'package:s06webservicept2navigation/web/product_repo.dart';

import '../bloc/cart_bloc.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> mProducts = [];
  CartBloc bloc = new CartBloc();
  int products;

  @override
  void initState() {
    ProductsRepo repo = new ProductsRepo();
    repo.getData().then((data) {
      setState(() {
        mProducts = data;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTS LIST'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: StreamBuilder<int>(
                  initialData: 0,
                  stream: bloc.getProductCountStream(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)
                      return Text(
                          snapshot.data.toString()
                      );
                    else{
                      return Text(
                          "0"
                      );
                    }
                  }
              ),
            ),
          )
        ],
      ),
      body: mProducts.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: mProducts.length, itemBuilder: _buildProductRow),
    );
  }

  Widget _buildProductRow(BuildContext context, int index) {
    return ProductRow(mProducts[index]);
  }
}
