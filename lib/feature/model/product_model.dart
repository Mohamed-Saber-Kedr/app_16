class ProductModel {
  final num price;
  final String name;
  final String image;
  final String status;
  final String category;
  final String id;

  ProductModel(
      {required this.name,
      required this.price,
      required this.image,
      required this.status,
      required this.category,required this.id });
  factory ProductModel.fromjson(Map<String,dynamic> json) {
    return ProductModel(
        name: json["name"],
        price: json["price"],
        image: json["image"],
        status: json["status"],
        category: json["category"],
        id: json["_id"]);
  }
}
