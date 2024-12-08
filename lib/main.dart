import 'package:flutter/material.dart';
import 'digital_clock_page.dart';
import 'analog_clock_page.dart';
import 'world_time_page.dart';
import 'timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Clock Timer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('World Clock Timer')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Digital Clock'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DigitalClockPage()),
            ),
          ),
          ListTile(
            title: const Text('Analog Clock'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnalogClockPage()),
            ),
          ),
          // ListTile(
          //   title: Text('World Time'),
          //   onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => WorldTimePage()),
          //   ),
          // ),
          ListTile(
            title: const Text('Timer'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimerPage()),
            ),
          ),
        ],
      ),
    );
  }
}
