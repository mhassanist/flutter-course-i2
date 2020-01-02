import 'package:flutter/material.dart';
import 'package:s06webservicept2navigation/model/product.dart';
import 'package:s06webservicept2navigation/ui/product_row_widget.dart';
import 'package:s06webservicept2navigation/web/product_repo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> mProducts = [];

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
        title: const Text('DraggableScrollableSheet'),
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
