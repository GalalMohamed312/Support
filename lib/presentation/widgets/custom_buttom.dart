import 'package:flutter/material.dart';
import 'package:support/presentation/utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double radius;
  final Color color;

  final  Function()? onPress;
  final Widget widget;

  const CustomButton({super.key,
    required this.onPress,
    this.text = 'Write text ',
    this.color = AppColors.white, this.radius=0, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius:   BorderRadius.circular(radius),
      ),
      padding: const EdgeInsets.all(10),
      onPressed: onPress,
      color:color,
      child: widget,
    );
  }
}
