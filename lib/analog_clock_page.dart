import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class AnalogClockPage extends StatefulWidget {
  const AnalogClockPage({super.key});

  @override
  _AnalogClockPageState createState() => _AnalogClockPageState();
}

class _AnalogClockPageState extends State<AnalogClockPage> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analog Clock')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: AnalogClockPainter(_currentTime),
          ),
        ),
      ),
    );
  }
}

class AnalogClockPainter extends CustomPainter {
  final DateTime dateTime;

  AnalogClockPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paintCircle = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final paintHourHand = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final paintMinuteHand = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final paintSecondHand = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw clock face
    canvas.drawCircle(center, radius, paintCircle);
    canvas.drawCircle(center, radius, paintBorder);

    // Draw hour hand
    final hourHandLength = radius * 0.5;
    final hourAngle =
        (dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180;
    final hourHandOffset = Offset(
      center.dx + hourHandLength * sin(hourAngle),
      center.dy - hourHandLength * cos(hourAngle),
    );
    canvas.drawLine(center, hourHandOffset, paintHourHand);

    // Draw minute hand
    final minuteHandLength = radius * 0.7;
    final minuteAngle = (dateTime.minute + dateTime.second / 60) * 6 * pi / 180;
    final minuteHandOffset = Offset(
      center.dx + minuteHandLength * sin(minuteAngle),
      center.dy - minuteHandLength * cos(minuteAngle),
    );
    canvas.drawLine(center, minuteHandOffset, paintMinuteHand);

    // Draw second hand
    final secondHandLength = radius * 0.9;
    final secondAngle = dateTime.second * 6 * pi / 180;
    final secondHandOffset = Offset(
      center.dx + secondHandLength * sin(secondAngle),
      center.dy - secondHandLength * cos(secondAngle),
    );
    canvas.drawLine(center, secondHandOffset, paintSecondHand);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Continuously repaint for updates
  }
}
