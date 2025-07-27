import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerCard extends StatelessWidget {
  const CategoryShimmerCard({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 90.r,
          height: 90.r,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
      SizedBox(height: 8.h),
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 60.r,
          height: 12.h,
          color: Colors.white,
          margin: EdgeInsets.only(top: 4.h),
        ),
      ),
    ],
  );
}
