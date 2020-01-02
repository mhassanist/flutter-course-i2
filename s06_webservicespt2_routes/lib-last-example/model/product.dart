class Product{
  String productName;
  String productDescription;
  String image;
  int productRating;

  Product(this.productName, this.productDescription, this.image, this.productRating);

  static Product fromJson(var json){
    String name = json['name'];
    String desc = json['description'];
    String imageUrl = json['image'];
    int rating = json['rating'];

    Product p = Product(name, desc, imageUrl, rating);
    return p;
  }
}