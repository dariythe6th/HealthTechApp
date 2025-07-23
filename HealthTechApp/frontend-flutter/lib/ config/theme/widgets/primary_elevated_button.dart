import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFBBCF9A),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
    );
  }
}
