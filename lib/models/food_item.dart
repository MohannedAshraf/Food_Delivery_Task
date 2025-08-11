import 'package:food_delivery_app/core/utils/asset_image.dart';

class FoodItem {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  bool isAddedToCart;

  FoodItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isAddedToCart = false,
  });

  static final List<FoodItem> foodItems = [
    FoodItem(
      id: 1,
      image: Myimages.burger,
      title: 'Burger',
      subtitle: 'description for Burger',
    ),
    FoodItem(
      id: 2,
      image: Myimages.pizza,
      title: 'Pizza',
      subtitle: 'description for Pizza',
    ),
    FoodItem(
      id: 3,
      image: Myimages.sandwitch,
      title: 'Sandwitch',
      subtitle: 'description for Sandwitch',
    ),
  ];
}
