import 'package:flutter/material.dart';

class CustomlistTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String? subtitle2;
  final double width;
  final double radius;
  final double height;
  final bool subtitlecheck;
  final bool showActionButtons;

  const CustomlistTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.height,
    required this.radius,
    this.subtitle2,
    this.subtitlecheck = false,
    this.showActionButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.021),
      height: screenHeight * (height / 812),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * (width / 375),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * (radius / 375)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: screenWidth * (16 / 375)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: screenHeight * (4 / 812)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.red[300],
                    fontSize: 14,
                  ),
                ),
                if (subtitlecheck && subtitle2 != null)
                  Text(
                    subtitle2!,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.red[300],
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
          if (showActionButtons)
            Row(
              children: [
                _actionButton(context, const Icon(Icons.minimize_sharp), () {}),
                const Text("  1  "),
                _actionButton(context, const Icon(Icons.add), () {}),
              ],
            ),
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context, Widget icon, Function()? ontap) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => ontap?.call(),
      child: Container(
        width: screenWidth * (35 / 375),
        height: screenHeight * (40 / 812),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 202, 206),
          borderRadius: BorderRadius.circular(screenWidth * (15 / 375)),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
