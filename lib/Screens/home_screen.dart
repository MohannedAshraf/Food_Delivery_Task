// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/navigation_bar.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/functions/app_route.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/grid_view.dart';
import 'package:food_delivery_app/core/widgets/list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Delivery",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,

              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),

                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.red.shade300),
                        SizedBox(width: 5),
                        Text(
                          "Search for foods",
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 250,
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
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            Text(
                              item['text']!,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
            ),
            Text(
              "Featured Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 15),
            // Buttons
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
                const SizedBox(width: 5),
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
            const SizedBox(height: 10),

            // View Switcher
            Expanded(
              child:
                  isListSelected
                      ? ListView.separated(
                        itemCount: items1.length,
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return CustomListView(
                            image: items1[index]['image']!,
                            text1: items1[index]['title']!,
                            text2: items1[index]['subtitle']!,
                          );
                        },
                      )
                      : GridView.builder(
                        itemCount: items1.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                        itemBuilder: (context, index) {
                          return CustomGridView(
                            image: items1[index]['image']!,
                            text1: items1[index]['title']!,
                            text2: items1[index]['subtitle']!,
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
  {'image': Myimages.nescalop, 'text': "nescalop"},
  {'image': Myimages.sandwitch, 'text': "sandwitch"},
];

List<Map<String, String>> items1 = [
  {
    'image': Myimages.burger,
    'title': "Burger",
    'subtitle': 'description for Burger',
  },
  {
    'image': Myimages.nescalop,
    'title': 'Nescalop',
    'subtitle': 'description for Nescalop',
  },
  {
    'image': Myimages.sandwitch,
    'title': 'Sandwitch',
    'subtitle': 'description for Sandwitch',
  },
  {
    'image': Myimages.burger,
    'title': "Burger",
    'subtitle': 'description for Burger',
  },
  {
    'image': Myimages.nescalop,
    'title': 'Nescalop',
    'subtitle': 'description for Nescalop',
  },
  {
    'image': Myimages.sandwitch,
    'title': 'Sandwitch',
    'subtitle': 'description for Sandwitch',
  },
];
