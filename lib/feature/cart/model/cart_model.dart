class CartModel {
  final String name;
  final String description;
  final String category;
  final String image;
  final num quantity;
  final num totalPrice;
  final String id;

  CartModel(
      {
      required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.image,
      required this.quantity,
      required this.totalPrice});
  factory CartModel.fromjson(Map<String, dynamic> json) {
    return CartModel(
        name: json["name"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
        id: json["_id"],
    );
  }
}
