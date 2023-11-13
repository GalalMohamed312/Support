import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final double radius;
  final Color color;
  final Color? borderColor;
  final double padding;
  final Alignment alignment;
  final Widget widget;

  const CustomContainer

  ({
  super.key,
  required this.widget,
  this.radius = 0,
  this.color = AppColors.white,
  this.alignment = Alignment.topLeft, this.padding=0, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color, // Set the background color
        borderRadius: BorderRadius.circular(radius),
         border: borderColor!=null?Border.all(
          color:borderColor!, // Set the color of the border
          width: 1, // Set the width of the border
        ):null,
      ),
      child: widget,
    );
  }
}
