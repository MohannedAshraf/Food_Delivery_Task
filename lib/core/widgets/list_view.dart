import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/food_item.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cartController = Provider.of<CartController>(context);
    final isInCart = cartController.cartItems.any(
      (item) => item.id == widget.foodItem.id,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: screenWidth * 0.015,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
              image: DecorationImage(
                image: AssetImage(widget.foodItem.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.025),

          //product
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodItem.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  widget.foodItem.subtitle,
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),

          //add to cart button
          SizedBox(
            height: screenHeight * 0.04,
            width: screenWidth * 0.25,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    isInCart ? Colors.red.shade200 : Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              ),
              onPressed: () {
                final cartItem = CartModel(
                  id: widget.foodItem.id,
                  quantity: 1,
                  title: widget.foodItem.title,
                  desc: widget.foodItem.subtitle,
                  image: widget.foodItem.image,
                  price: widget.foodItem.price,
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
