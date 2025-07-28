// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
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
          // Image container
          Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.025),

          // Texts and button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  text2,
                  style: TextStyle(
                    color: Colors.red.shade300,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),

          // Add to cart button
          SizedBox(
            height: screenHeight * 0.04,
            width: screenWidth * 0.25,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              ),
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
