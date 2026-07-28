
class Product{
  final String name;
  final String price;
  final double rating;
  final String image;
  final String description;
Product({
  required this.name,
  required this.price,
  required this.rating,
  required this.image,
  required this.description,
});
factory Product.fromJson(Map <String,dynamic> json){
  return Product(
  name: json['title'],
  price: "Rs ${json['price']}",
  rating: (json['rating']['rate'] as num).toDouble(),
  image: json['image'],
  description: json['description'],
  );
}}

