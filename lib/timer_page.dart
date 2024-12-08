import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;
  int _seconds = 0;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_seconds seconds', style: const TextStyle(fontSize: 48)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _startTimer, child: const Text('Start')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: _stopTimer, child: const Text('Stop')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: _resetTimer, child: const Text('Reset')),
            ],
          ),
        ],
      ),
    );
  }
}
