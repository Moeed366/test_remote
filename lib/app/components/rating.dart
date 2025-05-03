import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingItem extends StatelessWidget {
  final String label;
  final String rating;

  const RatingItem({super.key, required this.label, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(rating),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.yellow, size: 16),
        ],
      ),
    );
  }
}