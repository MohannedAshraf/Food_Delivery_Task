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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.4, // حوالي 40% من ارتفاع الشاشة
      width: screenWidth * 0.4, // حوالي 40% من عرض الشاشة
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
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            text1,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            text2,
            style: TextStyle(
              color: Colors.red.shade300,
              fontSize: screenWidth * 0.03,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            width: double.infinity,
            height: screenHeight * 0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade400,
            ),
            child: TextButton(
              onPressed: () {
                print("Added to cart");
              },
              child: Text(
                "Add to cart",
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
