import 'package:flutter/material.dart';

class CalendarPage extends Page<void> {
  const CalendarPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => CalendarRoute(this);
}

class CalendarRoute extends MaterialPageRoute<void> {
  CalendarRoute([CalendarPage? page])
      : super(
          settings: page,
          builder: (context) => const CalendarScreen(),
        );
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CalendarScreen')),
      body: const Center(
        child: Text('here goes calendar'),
      ),
    );
  }
}
