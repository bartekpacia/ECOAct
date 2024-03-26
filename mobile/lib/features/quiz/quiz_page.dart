import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/features/quiz/quiz_models.dart';
import 'package:mobile/resources/theme.dart';

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
      body: ListView(
        children: [
          for (final question in quiz.questions)
            AnswersList(
              question: question,
              selectedAnswerText: 'walked',
              onAnswerSelected: (answer) {},
            ),
        ],
      ),
    );
  }
}

// with singlechildscrollview
class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    required this.selectedAnswerText,
  });

  final Question question;
  final void Function(Answer) onAnswerSelected;
  final String selectedAnswerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
          child: Text(
            question.question,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Color(int.parse(question.color)).darken(),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: question.answers
                .map(
                  (answer) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: AnswerTile(
                      text: answer.answer,
                      assetPath: 'assets/images/answers/${answer.icon}',
                      color: Color(int.parse(question.color)),
                      selected: selectedAnswerText == answer.answer,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.text,
    required this.assetPath,
    required this.color,
    required this.selected,
  });

  final String text;
  final String assetPath;
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final darkerColor = color.darken(amount: 0.2);

    return Container(
      decoration: BoxDecoration(
        color: selected ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 4, color: darkerColor),
      ),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                assetPath,
                color: selected ? context.colorScheme.onPrimary : darkerColor,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color:
                        selected ? context.colorScheme.onPrimary : darkerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
