import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(HomePage());

class Product{
  String productName;
  String productDescription;
  String image;
  int productRating;

  Product(this.productName, this.productDescription, this.image, this.productRating);

}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List ps = [];

  @override
  void initState() {

    _getData("http://ec2-18-189-170-234.us-east-2.compute.amazonaws.com/upload/products.php");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: ListView.builder(
            itemCount: ps.length,
            itemBuilder: _buildProductRow

        )
        ,
      ),
    );
  }

  _getData(String url) async{
     http.Response responseData = await http.get(url);
     List<dynamic> data = jsonDecode(responseData.body);
     setState(() {
       ps = data;
     });

  }

  Widget _buildProductRow(BuildContext context, int index) {
    return ProductRow(ps[index]);
  }
}

class ProductRow extends StatelessWidget {
  var p;
  ProductRow(this.p);

  /*ProductRow(Product p ){
    this.p = p;
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            width: 100,
            height: 100,
            image: NetworkImage(p['image']),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(p['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Text(p['description']),
              ],
            ),
          ),
          Icon(Icons.star),
          Text("4")
        ],
      ),
    );
  }
}
