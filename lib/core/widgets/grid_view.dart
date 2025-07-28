// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });

  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text2,
            style: TextStyle(color: Colors.red.shade300, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade400,
            ),
            child: TextButton(
              onPressed: () {
                print("Added to cart");
              },
              child: const Text(
                "Add to cart",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
