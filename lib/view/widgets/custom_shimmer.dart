import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomShimmer(
      {this.height,
      this.width,});

  const CustomShimmer.circle(double radius)
      : this(height: radius, width: radius);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        margin: const EdgeInsets.symmetric(
        ),
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
