import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final String title;
  final double price;
  final Color bg;

  const ProductCard({
    super.key,
    required this.img,
    required this.title,
    required this.price,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromRGBO(216, 240, 253, 1),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            Center(child: Image.asset(img, height: 175))
          ],
        ),
      ),
    );
  }
}
