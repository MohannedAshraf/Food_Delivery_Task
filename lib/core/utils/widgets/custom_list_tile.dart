import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/asset_image.dart';
import 'package:food_delivery_app/core/utils/functions/app_size.dart';

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
    return Container(
      padding: EdgeInsets.all(DeviceWidthHeight.perentageOfWidth(8)),
      height: DeviceWidthHeight.perentageOfHeight(height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: DeviceWidthHeight.perentageOfWidth(width),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DeviceWidthHeight.perentageOfWidth(radius),
              ),
              image: DecorationImage(
                image: AssetImage(Myimages.burger),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: DeviceWidthHeight.perentageOfWidth(16)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                SizedBox(height: DeviceWidthHeight.perentageOfHeight(4)),
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
                _actionButton(Icon(Icons.minimize_sharp), () {}),

                Text("  1  "),
                _actionButton(Icon(Icons.add), () {}),
              ],
            ),
        ],
      ),
    );
  }
}

Widget _actionButton(Widget icon, Function()? ontap) {
  return GestureDetector(
    onTap: () => ontap,
    child: Container(
      width: DeviceWidthHeight.perentageOfWidth(35),
      height: DeviceWidthHeight.perentageOfHeight(40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 202, 206),
        borderRadius: BorderRadius.circular(
          DeviceWidthHeight.perentageOfWidth(15),
        ),
      ),
      child: Center(child: icon),
    ),
  );
}
