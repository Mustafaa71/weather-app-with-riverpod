import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.title, required this.result});
  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        Text(
          result,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
