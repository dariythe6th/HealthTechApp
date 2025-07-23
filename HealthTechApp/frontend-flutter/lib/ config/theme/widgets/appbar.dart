import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text('Home', style: Theme.of(context).textTheme.titleLarge),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFDEE9D3),
      actions: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Color(0xFF364025),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
