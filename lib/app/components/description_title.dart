


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        description,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}