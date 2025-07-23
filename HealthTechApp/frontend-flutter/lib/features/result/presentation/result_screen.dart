import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_sharp,
            color: Color(0xFF1D1B20),
          ),
          onPressed: () {
            context.router.back();
          },
        ),
        title: Center(
          child: Text('Result', style: Theme.of(context).textTheme.titleLarge),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFDEE9D3),
        actions: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF364025),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
