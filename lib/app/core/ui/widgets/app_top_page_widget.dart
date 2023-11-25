import 'package:flutter/widgets.dart';

//Copy this CustomPainter code to the Bottom of the File
class AppTopPageWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7979787, size.height * 0.7400000);
    path_0.cubicTo(size.width * 0.8697253, size.height * 0.7400000, size.width * 0.9624507, size.height * 0.9000000,
        size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.3864853, 0);
    path_0.cubicTo(size.width * 0.3520373, size.height * 0.2233338, size.width * 0.3078907, size.height * 0.6486074,
        size.width * 0.3864853, size.height * 0.8450000);
    path_0.cubicTo(size.width * 0.5205467, size.height * 1.180000, size.width * 0.6834667, size.height * 0.7400000,
        size.width * 0.7979787, size.height * 0.7400000);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFFD5CA).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7979787, size.height * 0.7400000);
    path_1.cubicTo(size.width * 0.8697253, size.height * 0.7400000, size.width * 0.9624507, size.height * 0.9000000,
        size.width, size.height);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width * 0.3864853, 0);
    path_1.cubicTo(size.width * 0.3520373, size.height * 0.2233338, size.width * 0.3078907, size.height * 0.6486074,
        size.width * 0.3864853, size.height * 0.8450000);
    path_1.cubicTo(size.width * 0.5205467, size.height * 1.180000, size.width * 0.6834667, size.height * 0.7400000,
        size.width * 0.7979787, size.height * 0.7400000);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFFD5CA).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.2020224, size.height * 0.7400000);
    path_2.cubicTo(size.width * 0.1302755, size.height * 0.7400000, size.width * 0.03754960, size.height * 0.9000000, 0,
        size.height);
    path_2.lineTo(0, 0);
    path_2.lineTo(size.width * 0.6135147, 0);
    path_2.cubicTo(size.width * 0.6479627, size.height * 0.2233338, size.width * 0.6921093, size.height * 0.6486074,
        size.width * 0.6135147, size.height * 0.8450000);
    path_2.cubicTo(size.width * 0.4794533, size.height * 1.180000, size.width * 0.3165333, size.height * 0.7400000,
        size.width * 0.2020224, size.height * 0.7400000);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffFFD5CA).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.2020224, size.height * 0.7400000);
    path_3.cubicTo(size.width * 0.1302755, size.height * 0.7400000, size.width * 0.03754960, size.height * 0.9000000, 0,
        size.height);
    path_3.lineTo(0, 0);
    path_3.lineTo(size.width * 0.6135147, 0);
    path_3.cubicTo(size.width * 0.6479627, size.height * 0.2233338, size.width * 0.6921093, size.height * 0.6486074,
        size.width * 0.6135147, size.height * 0.8450000);
    path_3.cubicTo(size.width * 0.4794533, size.height * 1.180000, size.width * 0.3165333, size.height * 0.7400000,
        size.width * 0.2020224, size.height * 0.7400000);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffFFD5CA).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
