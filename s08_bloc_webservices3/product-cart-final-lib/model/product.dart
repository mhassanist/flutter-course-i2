class Product {
  String productName;
  String productDescription;
  String image;
  int productRating;
  int id;

  /*Product(int id){
    this.id = id;
  }*/
  /*Product(this.id, this.productName, this.productDescription, this.image,
      this.productRating);*/

  Product.fromJson(var json) {
    this.productName = json['name'];
    this.productDescription = json['description'];
    this.image = json['image'];
    this.productRating = json['rating'];
    this.id = json['id'];
  }

  //for example
  //AdvancedProduct extends Product
  //ConfigurbleProduct extends Product


}

//Product p = new Product (1,"","","",4);
//Product p = new Product.fromJson("{"id:4"}");
