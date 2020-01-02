import 'package:flutter/material.dart';
import 'package:s06webservicept2navigation/model/product.dart';

class ProductRow extends StatelessWidget {
  Product p;
  ProductRow(this.p);

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildRow(),
    );
  }

  Widget _buildRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          width: 100,
          height: 100,
          image: NetworkImage(p.image),
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
        Text(p.productRating.toString())
      ],
    );
  }
}