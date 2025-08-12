import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/food_item.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cartController = Provider.of<CartController>(context);
    final isInCart = cartController.cartItems.any(
      (item) => item.id == foodItem.id,
    );

    return Container(
      height: screenHeight * 0.4,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(foodItem.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),

          Text(
            foodItem.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),

          Text(
            foodItem.subtitle,
            style: TextStyle(
              color: Colors.red.shade300,
              fontSize: screenWidth * 0.03,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),

          // add to cart
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.04,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    isInCart ? Colors.red.shade200 : Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                final cartItem = CartModel(
                  id: foodItem.id,
                  quantity: 1,
                  title: foodItem.title,
                  desc: foodItem.subtitle,
                  image: foodItem.image,
                  price: foodItem.price,
                );

                if (isInCart) {
                  cartController.removeItemFromCart(cartItem);
                } else {
                  cartController.addItemToCart(cartItem);
                }
              },
              child: Text(
                isInCart ? "Remove" : "Add to cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
