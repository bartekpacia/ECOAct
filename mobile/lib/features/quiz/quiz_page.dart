import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/quiz/quiz_models.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/score_model.dart';
import 'package:provider/provider.dart';

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

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final answersChangeNotifier = Provider.of<AnswersChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('QuizScreen')),
      body: ListView(
        children: [
          for (int i = 0; i < quiz.questions.length; i++)
            AnswersList(
              question: quiz.questions[i],
              selectedAnswers: answersChangeNotifier.answers
                      .firstWhereOrNull(
                        (elem) => elem.questionId == 'question_$i',
                      )
                      ?.answers ??
                  [],
              onAnswerSelected: (answer) {
                answersChangeNotifier.selectAnswer(
                  questionId: quiz.questions[i].id,
                  answer: answer,
                );
              },
              onAnswerUnselected: (answer) {
                answersChangeNotifier.unselectAnswer(
                  questionId: quiz.questions[i].id,
                  answer: answer,
                );
              },
            ),
        ],
      ),
    );
  }
}

class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.question,
    required this.selectedAnswers,
    required this.onAnswerSelected,
    required this.onAnswerUnselected,
  });

  final Question question;
  final List<String> selectedAnswers;
  final ValueChanged<String> onAnswerSelected;
  final ValueChanged<String> onAnswerUnselected;

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
                    child: GestureDetector(
                      onTap: () {
                        if (selectedAnswers.contains(answer.answer)) {
                          onAnswerUnselected(answer.answer);
                        } else {
                          onAnswerSelected(answer.answer);
                        }
                      },
                      child: SingleAnswerTile(
                        text: answer.answer,
                        assetPath: 'assets/images/answers/${answer.icon}',
                        color: Color(int.parse(question.color)),
                        selected: selectedAnswers.contains(answer.answer),
                      ),
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

class SingleAnswerTile extends StatelessWidget {
  const SingleAnswerTile({
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
