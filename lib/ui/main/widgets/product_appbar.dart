import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Products",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 4,
      backgroundColor: Colors.blueAccent,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
