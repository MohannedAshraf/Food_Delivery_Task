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
    Color color = isselected ? Colors.grey.shade400 : Colors.red;
    Color textcolor = isselected ? Colors.black : Colors.white;

    return Container(
      height: 40,
      width: 177.5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
