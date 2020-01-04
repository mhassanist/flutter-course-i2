import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:s06webservicept2navigation/model/product.dart';

class ProductsRepo {
  List<Product> mProducts = [];

  Future<List<Product>> getData() async {
    String url = "http://ec2-18-189-170-234.us-east-2.compute.amazonaws.com/upload/products.php";

    http.Response responseData = await http.get(url);
    List<dynamic> productsFromWeb = jsonDecode(responseData.body);

    for (int i = 0; i < productsFromWeb.length; i++) {
      Product p = Product.fromJson(productsFromWeb[i]);
      mProducts.add(p);
    }

    return mProducts;
  }
}
