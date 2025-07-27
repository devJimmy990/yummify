import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrderShimmerCard extends StatelessWidget {
  const OrderShimmerCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        leading: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        title: Container(
          height: 14.h,
          width: 120.w,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8.h),
        ),
        subtitle: Container(height: 12.h, width: 100.w, color: Colors.white),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 14.h, width: 50.w, color: Colors.white),
            SizedBox(height: 6.h),
            Container(height: 12.h, width: 40.w, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}
