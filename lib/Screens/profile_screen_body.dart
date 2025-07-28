// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    double getWidth(double wdt) {
      const designWidth = 375;
      return (wdt * screenWidth) / designWidth;
    }

    double getHeight(double hgt) {
      const designHeight = 812;
      return (hgt * screenHeight) / designHeight;
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getHeight(30)),
          SizedBox(
            width: getWidth(150),
            height: getHeight(150),
            child: CircleAvatar(
              backgroundImage: AssetImage(Myimages.myphoto),
              radius: 20,
              backgroundColor: Colors.amberAccent,
            ),
          ),
          SizedBox(height: getHeight(10)),
          const Text(
            "Mohanned Ashraf",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getHeight(5)),
          Text(
            "mohannedashraf@gamil.com",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.red[300],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: getHeight(30)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50]),
            onPressed: () {
              print("iam out ");
            },
            child: const Text("Log out"),
          ),
        ],
      ),
    );
  }
}
