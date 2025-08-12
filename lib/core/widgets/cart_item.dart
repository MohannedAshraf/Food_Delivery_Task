import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      title: Text(
        cartItem.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(cartItem.desc),
      leading: Image.asset(
        cartItem.image,
        height: 70,
        width: 70,
        fit: BoxFit.cover,
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            const Text('1'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
