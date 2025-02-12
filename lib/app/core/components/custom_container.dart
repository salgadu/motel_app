import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';

class CustomContainer extends StatelessWidget {
  final Widget content;

  const CustomContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: (MediaQuery.of(context).size.width * 0.93),
      ),
      padding: EdgeInsets.all(
        Dimensions.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: content,
    );
  }
}
