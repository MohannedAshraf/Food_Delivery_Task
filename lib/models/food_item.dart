import 'package:food_delivery_app/core/utils/asset_image.dart';

class FoodItem {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final double price;

  FoodItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  static final List<FoodItem> foodItems = [
    FoodItem(
      id: 1,
      image: Myimages.burger,
      title: 'Burger',
      subtitle: 'description for Burger',
      price: 100.0,
    ),
    FoodItem(
      id: 2,
      image: Myimages.pizza,
      title: 'Pizza',
      subtitle: 'description for Pizza',
      price: 200.0,
    ),
    FoodItem(
      id: 3,
      image: Myimages.sandwitch,
      title: 'Sandwitch',
      subtitle: 'description for Sandwitch',
      price: 50.0,
    ),
  ];
}
