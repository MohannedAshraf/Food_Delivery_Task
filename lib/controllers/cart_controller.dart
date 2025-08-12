import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [];

  void addItemToCart(CartModel item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(CartModel item) {
    cartItems.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  // increase quantity
  double increaseQuantity(CartModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1 && cartItems[index].quantity > 0) {
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity + 1,
      );
      notifyListeners();
    }
    return subtotal;
  }

  // decrease quantity
  double decreaseQuantity(CartModel item) {
    final index = cartItems.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index] = cartItems[index].copyWith(
          quantity: cartItems[index].quantity - 1,
        );
      } else {
        cartItems.removeAt(index);
      }
      notifyListeners();
    }
    return subtotal;
  }

  //clear cart
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  // subtotal
  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // calc tax
  double get tax => subtotal * 0.10;

  // calc delivery fee
  double get deliveryFee => subtotal * 0.01;

  // calc total
  double get total => subtotal + tax + deliveryFee;
}
