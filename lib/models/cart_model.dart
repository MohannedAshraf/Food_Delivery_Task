class CartModel {
  final int quantity;
  final String title;
  final String desc;
  final String image;
  final int id;
  final double price; // السعر

  const CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });

  CartModel copyWith({
    int? quantity,
    String? title,
    String? desc,
    String? image,
    int? id,
    double? price,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}
