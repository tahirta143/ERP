import 'dart:math';
import 'package:flutter/material.dart';

final List<Color> _SummaryColors = [
  Colors.blue.shade900,
  Colors.green.shade300,
  Colors.orange.shade300,
  Colors.purple.shade300,
  Colors.red.shade300,
  Colors.teal.shade300,
  Colors.indigo.shade300,
  Colors.pink.shade300,
];
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final int? index;
  final VoidCallback? onTap; // callback when tapped

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pick color based on index
    Color color = index != null
        ? _SummaryColors[index! % _SummaryColors.length]
        : _SummaryColors[Random().nextInt(_SummaryColors.length)];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.25),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 6),
            // Title
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            // Value
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
