import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';

class CustomIcon extends StatelessWidget {
  final String icon;

  const CustomIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: icon,
        width: Dimensions.largeIconSize,
        height: Dimensions.largeIconSize,
      ),
    );
  }
}
