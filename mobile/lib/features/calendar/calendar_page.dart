import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/extensions.dart';
import 'package:mobile/navigation/routes.dart';
import 'package:mobile/state/quiz_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

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

class CalendarScreen extends HookWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final answersChangeNotifier = Provider.of<QuizChangeNotifier>(context);

    final selectedDay = useState<DateTime?>(null);
    final focusedDay = useState<DateTime?>(null);

    return Scaffold(
      appBar: AppBar(title: const Text('CalendarScreen')),
      body: Center(
        child: Column(
          children: [
            TableCalendar<void>(
              onFormatChanged: (_) {},
              firstDay: DateTime.utc(2005, 4, 2),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              selectedDayPredicate: (selectedDayCandidate) {
                return false;
              },
              onDaySelected: (newSelectedDay, newFocusedDay) {
                selectedDay.value = newSelectedDay;
                focusedDay.value = newFocusedDay;

                if (newSelectedDay.isAfter(DateTime.now())) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This quiz is in the future'),
                      backgroundColor: Colors.red,
                    ),
                  );

                  return;
                }

                GoQuizRoute(
                  dateId: newSelectedDay.toDateId(),
                ).push<void>(context);
              },
              calendarBuilders: CalendarBuilders(
                outsideBuilder: (context, day, focusedDay) {
                  final selected = answersChangeNotifier.answers.any((answer) {
                    return day.toDateId() == answer.date.toDateId();
                  });

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.green.shade700 : null,
                    ),
                    child: Text(
                      day.day.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  final selected = answersChangeNotifier.answers.any((answer) {
                    return day.toDateId() == answer.date.toDateId();
                  });

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? Colors.green.shade700 : null,
                    ),
                    child: Text(day.day.toString()),
                  );
                },
              ),
            ),
            const Text('Welcome, user!'),
          ],
        ),
      ),
    );
  }
}
