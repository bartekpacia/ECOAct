import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class QuizPage extends Page<void> {
  const QuizPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => QuizRoute(this);
}

class QuizRoute extends MaterialPageRoute<void> {
  QuizRoute([QuizPage? page])
      : super(
          settings: page,
          builder: (context) => const QuizScreen(),
        );
}

class QuizScreen extends HookWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDay = useState<DateTime?>(null);
    final focusedDay = useState<DateTime?>(null);

    return Scaffold(
      appBar: AppBar(title: const Text('QuizScreen')),
      body: Center(
        child:
    );
  }
}
