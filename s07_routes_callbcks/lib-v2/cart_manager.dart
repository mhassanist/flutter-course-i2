
import 'dart:async';

import 'package:s06webservicept2navigation/model/cart.dart';
import 'package:s06webservicept2navigation/model/product.dart';

class CartBloc{

  static StreamController _cartStreamController
  = new StreamController<Cart>();

  static Cart _cart = Cart.myCart;

  static Stream getStream(){
    return _cartStreamController.stream;
  }


  static addProductToCart(Product p){
    _cart.addProduct(p);
    _cartStreamController.sink.add(_cart);
  }

  static removeProductToCart(Product p){
    _cart.deleteProduct(p);
    _cartStreamController.sink.add(_cart);
  }

  static getCartItems(){
    return _cart.getProducts();
  }

  static getCartItemCount(){
    return _cart.getProducts().length;
  }


}