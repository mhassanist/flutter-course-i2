import 'dart:async';
import 'package:s06webservicept2navigation/model/cart.dart';
import 'package:s06webservicept2navigation/model/product.dart';

class CartBloc {
  //Singleton Pattern Logic
  static CartBloc _bloc = CartBloc._internal();

  CartBloc._internal();

  factory CartBloc() {
    if(!_productEventController.hasListener)
        _productEventController.stream.listen(_acceptProductEvent);

    return _bloc;
  }

  //End of Singleton Logic

  static StreamController _productEventController =
      new StreamController<ProductEvent>();
  static StreamController _cartCountController = new StreamController<int>();

  static Cart _cart = Cart();

  static void _acceptProductEvent(dynamic pEvent){
    Product p = pEvent.p;

    if(pEvent is AddProductEvent)
      _cart.addProduct(p);
    else if(pEvent is RemoveProductEvent)
      _cart.deleteProduct(p);


    _cartCountController.sink.add(_cart.getProductsCount());
  }
  Sink getProductEventSink() {
    return _productEventController.sink;
  }

  Stream getProductCountStream() {
    return _cartCountController.stream;
  }


  getCartItems() {
    return _cart.getProducts();
  }

  getCartItemCount() {
    return _cart.getProducts().length;
  }
}

class ProductEvent {

  Product p;
  ProductEvent(this.p);
}

class AddProductEvent extends ProductEvent {
  AddProductEvent(p) : super(p);
}

class RemoveProductEvent extends ProductEvent {
  RemoveProductEvent(p) : super(p);
}
