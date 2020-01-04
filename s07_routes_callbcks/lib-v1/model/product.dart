class Product{
  String productName;
  String productDescription;
  String image;
  int productRating;
  int id;

  Product(this.id,this.productName, this.productDescription, this.image, this.productRating);

  static Product fromJson(var json){
    String name = json['name'];
    String desc = json['description'];
    String imageUrl = json['image'];
    int rating = json['rating'];
    int id = json['id'];

    Product p = Product(id, name, desc, imageUrl, rating);
    return p;
  }
}