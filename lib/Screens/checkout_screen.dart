import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/core/widgets/cart_item.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        if (cartController.cartItems.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Cart",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/empty.json',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'There is no Item in Cart, Please Discover and return here after adding items',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text("Cart")),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartController.cartItems[index];
                      return CartItemWidget(cartItem: cartItem);
                    },
                  ),
                ),

                //total price
                ListTile(
                  title: const Text('Subtotal'),
                  trailing: Text(
                    '\$${cartController.subtotal.toStringAsFixed(2)}',
                  ),
                ),
                ListTile(
                  title: const Text('Delivery Fee'),
                  trailing: Text(
                    '\$${cartController.deliveryFee.toStringAsFixed(2)}',
                  ),
                ),
                ListTile(
                  title: const Text('Tax'),
                  trailing: Text('\$${cartController.tax.toStringAsFixed(2)}'),
                ),
                ListTile(
                  title: const Text('Total'),
                  trailing: Text(
                    '\$${cartController.total.toStringAsFixed(2)}',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      //clear cart
                      Provider.of<CartController>(
                        context,
                        listen: false,
                      ).clearCart();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE82933),
                      fixedSize: const Size(300, 48),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
