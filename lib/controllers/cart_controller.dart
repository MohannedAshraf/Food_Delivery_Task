import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [];

  // Show snack-bar if item is added
  void addItemToCart(CartModel item) {
    cartItems.add(item);
    notifyListeners(); // setState
  }

  void removeItemFromCart(CartModel item) {
    cartItems.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }
}
