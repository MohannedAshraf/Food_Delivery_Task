// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/navigation_bar.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/functions/app_route.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/grid_view.dart';
import 'package:food_delivery_app/core/widgets/list_view.dart';
import 'package:food_delivery_app/models/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListSelected = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Delivery",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppRoute.navigateTo(MainNavigation(index: 1));
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.05,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search, color: Colors.red.shade300),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          "Search for foods",
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: screenHeight * 0.3,
                viewportFraction: 1,
              ),
              items:
                  items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight * 0.18,
                              margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.01,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.025,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              item['text']!,
                              style: TextStyle(fontSize: screenWidth * 0.045),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Featured Items",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  text: "List View",
                  isselected: isListSelected,
                  onTap: () {
                    setState(() {
                      isListSelected = true;
                    });
                  },
                ),
                SizedBox(width: screenWidth * 0.015),
                CustomButton(
                  text: "Grid View",
                  isselected: !isListSelected,
                  onTap: () {
                    setState(() {
                      isListSelected = false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child:
                  isListSelected
                      ? ListView.builder(
                        itemCount: FoodItem.foodItems.length,

                        itemBuilder: (context, index) {
                          return CustomListView(
                            foodItem: FoodItem.foodItems[index],
                          );
                        },
                      )
                      : GridView.builder(
                        itemCount: FoodItem.foodItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: screenHeight * 0.015,
                          crossAxisSpacing: screenWidth * 0.025,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) {
                          return CustomGridView(
                            foodItem: FoodItem.foodItems[index],
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> items = [
  {'image': Myimages.burger, 'text': "burger"},
  {'image': Myimages.pizza, 'text': "pizza"},
  {'image': Myimages.sandwitch, 'text': "sandwitch"},
];
