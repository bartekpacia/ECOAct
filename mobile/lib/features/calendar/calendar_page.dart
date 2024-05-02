import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/extensions.dart';
import 'package:mobile/navigation/routes.dart';
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

                GoQuizRoute(
                  dateId: newSelectedDay.toDateId(),
                ).push<void>(context);
              },
              calendarBuilders: CalendarBuilders(
                outsideBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return Center(child: Text(day.day.toString()));
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
