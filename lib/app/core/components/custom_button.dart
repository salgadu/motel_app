import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black87, width: 0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.black87, size: 18),
              const SizedBox(width: Dimensions.smallPadding),
            ],
            Text(
              text,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
