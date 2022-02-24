import 'package:flutter/material.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/helper/extensions/context_extention.dart';
import 'package:warranty_watch/widget/shimmer_loader.dart';

class MoviesSkeletonLoader extends StatelessWidget {
  const MoviesSkeletonLoader();

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                color: Constants.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
