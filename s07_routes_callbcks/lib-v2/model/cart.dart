
import 'package:s06webservicept2navigation/model/product.dart';

class Cart{

  static Cart myCart = new Cart();

  List<Product> mProducts = [];

  addProduct(Product p){
    myCart.mProducts.add(p);
  }

  deleteProduct(Product p){
    //loop products
    //delete product of the same id

    for(int i =0 ; i< mProducts.length; i++){
      if(mProducts[i].id == p.id){
        myCart.mProducts.removeAt(i);
      }
    }
  }

  getProductsCount(){
    return myCart.mProducts.length;
  }

  List<Product> getProducts(){
    return myCart.mProducts;
  }

}