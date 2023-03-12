import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.cardChild});
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: double.infinity,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1c0c20).withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: cardChild,
    );
  }
}
