import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isselected;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.isselected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Color color = isselected ? Colors.grey.shade400 : Colors.red;
    Color textcolor = isselected ? Colors.black : Colors.white;

    return Container(
      height: screenHeight * 0.05,
      width: screenWidth * 0.45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(screenWidth * 0.08),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
