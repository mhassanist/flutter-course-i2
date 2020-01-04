import 'package:flutter/material.dart';
import 'package:s06webservicept2navigation/cart_manager.dart';
import 'package:s06webservicept2navigation/model/product.dart';
import 'package:s06webservicept2navigation/ui/product_details.dart';

class ProductRow extends StatelessWidget {

  Product p;
  ProductRow(this.p);

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildRow(context),
    );
  }

  Widget _buildRow(context){


     return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsScreen(p)),
        );

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: "tag${p.id}",
            child: Image(
              width: 100,
              height: 100,
              image: NetworkImage(p.image),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(p.productName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text(p.productDescription),
              ],
            ),
          ),
          Icon(Icons.star),
          Text(p.productRating.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              CartBloc.addProductToCart(p);
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: (){
              CartBloc.removeProductToCart(p);
            },
          )
        ],
      ),
    );
  }
}