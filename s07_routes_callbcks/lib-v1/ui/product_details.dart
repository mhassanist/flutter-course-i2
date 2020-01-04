import 'package:flutter/material.dart';
import 'package:s06webservicept2navigation/model/cart.dart';
import 'package:s06webservicept2navigation/model/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product p;

  var updateCart;

  ProductDetailsScreen(this.p, this.updateCart);
  @override
  _ProductDetailsScreen createState() => _ProductDetailsScreen();
}

class _ProductDetailsScreen extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "tag${widget.p.id}",
                  child: Image(
                    height: 400,
                    image: NetworkImage(widget.p.image),
                  ),
                ),
                Text(widget.p.productDescription),
                RaisedButton(
                  child: Text("Add To Cart"),
                  onPressed: (){
                      Cart c = new Cart();
                      c.addProduct(widget.p);
                      widget.updateCart(c);
                  },
                )

              ],
            ),
          ),
        ),

      );
  }
}
