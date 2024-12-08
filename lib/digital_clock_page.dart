import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DigitalClockPage extends StatefulWidget {
  const DigitalClockPage({super.key});

  @override
  _DigitalClockPageState createState() => _DigitalClockPageState();
}

class _DigitalClockPageState extends State<DigitalClockPage> {
  String _time = '';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _time = DateFormat('hh:mm:ss a').format(now); // Change format if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Digital Clock')),
      body: Center(
        child: Text(
          _time,
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
