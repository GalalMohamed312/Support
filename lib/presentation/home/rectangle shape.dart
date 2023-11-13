import 'package:flutter/material.dart';
import 'package:support/presentation/utils/app_colors.dart';
import 'package:support/presentation/utils/app_strings.dart';
import 'package:support/presentation/utils/font_manager.dart';
import 'package:support/presentation/utils/values_manager.dart';

class CombinedShape extends StatelessWidget {
  const CombinedShape({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 50,
      child: CustomPaint(
        painter: CombinedShapePainter(),
      ),
    );
  }
}

class CombinedShapePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Paint rectanglePaint = Paint()..color = AppColors.deepBlue;
    final Paint triangleBorderPaint = Paint()
      ..color = AppColors.deepBlue;


    // Draw rectangle
    canvas.drawRect(
      Rect.fromPoints(const Offset(0, 0), Offset(2*size.width/3, size.height)),
      rectanglePaint,
    );

    // Draw triangle
    final Path trianglePath = Path();
    trianglePath.moveTo(2 * size.width / 3, 0);
    trianglePath.lineTo(size.width, size.height);
    trianglePath.lineTo(2*size.width/3, size.height);
    trianglePath.close();
    // Draw line above the triangle
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(2 * size.width / 3, 0),
      Offset(size.width, size.height),
      linePaint,
    );
    canvas.drawPath(trianglePath, triangleBorderPaint);
    final TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text:TextApp.hotelsSearch ,
        style: TextStyle(color:AppColors.white, fontSize:AppSize.s16,
        fontWeight: FontWeightManager.bold
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: size.width - 8); // Adjusting maxWidth to include padding
    final Offset textOffset = Offset(8, (size.height - textPainter.height) / 2);
    textPainter.paint(canvas, textOffset);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
