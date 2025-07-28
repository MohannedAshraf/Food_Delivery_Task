// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/widgets/custom_list_tile.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Column(
      children: [
        CustomlistTile(
          image: Myimages.burger,
          title: "Burger Palace",
          subtitle: "2 items",
          width: 70,
          height: 100,
          radius: 12,
          showActionButtons: false,
        ),
        CustomlistTile(
          image: Myimages.burger,
          subtitlecheck: true,
          title: "Classic Burger",
          subtitle2: "Burger Palace",
          subtitle: "Size :Large",
          width: 90,
          height: 120,
          radius: 15,
        ),
        CustomlistTile(
          image: Myimages.burger,
          title: "Chicken Burger",
          subtitlecheck: true,
          subtitle2: "Burger Palace",
          subtitle: "Size : Medium",
          width: 90,
          height: 120,
          radius: 15,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.08),
          child: Column(
            children: [
              _textpricess("SubTotal", "\$25.0"),
              SizedBox(height: screenHeight * 0.02),
              _textpricess("Delivery fees", "\$5.00"),
              SizedBox(height: screenHeight * 0.02),
              _textpricess("Taxes", "\$2.50"),
              SizedBox(height: screenHeight * 0.02),
              _textpricess("Total", "\$32.5"),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Check OUT");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                  ),
                  child: const Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _textpricess(String txt1, String txt2) {
  return Row(children: [Text(txt1), const Spacer(), Text(txt2)]);
}
