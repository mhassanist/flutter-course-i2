import 'package:s06webservicept2navigation/model/product.dart';

class Cart{

  List<Product> mProducts = [];

  addProduct(Product p){
    mProducts.add(p);
  }

  deleteProduct(Product p){
    //loop products
    //delete product of the same id

    for(int i =0 ; i< mProducts.length; i++){
      if(mProducts[i].id == p.id){
        mProducts.removeAt(i);
      }
    }
  }

  getProductsCount(){
    return mProducts.length;
  }

  List<Product> getProducts(){
    return mProducts;
  }

}