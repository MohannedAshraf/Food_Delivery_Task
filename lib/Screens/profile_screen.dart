import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
