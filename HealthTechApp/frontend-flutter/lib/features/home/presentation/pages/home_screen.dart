import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_app/%20config/theme/widgets/drawer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      drawer: DrawerWidget(),
      body: const Center(child: Text('Main content here')),
    );
  }
}
