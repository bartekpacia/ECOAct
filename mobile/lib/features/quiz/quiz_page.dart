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
    return Scaffold(
      appBar: AppBar(title: const Text('QuizScreen')),
      body: ListView(
        children: [
          for (final question in quiz.questions)
            if (question.question == 'Estimate how much water you used today :')
              WaterConsumptionWidget(question: question)
            else
              AnswersList(
                question: question,
                onAnswerSelected: (answer) {},
              ),
        ],
      ),
    );
  }
}

class WaterConsumptionWidget extends StatefulWidget {

  const WaterConsumptionWidget({super.key, required this.question});
  final Question question;

  @override
  _WaterConsumptionWidgetState createState() => _WaterConsumptionWidgetState();
}

class _WaterConsumptionWidgetState extends State<WaterConsumptionWidget> {
  final TextEditingController _controller = TextEditingController();

void _handleSubmit(String value) {
  final consumption = int.tryParse(value) ?? 0;
  final scoreModel = Provider.of<ScoreModel>(context, listen: false);

  if (consumption > 150) {
    scoreModel.decrement(10);
  } else if (consumption > 100) {
    scoreModel.increment(5);
  } else {
    scoreModel.increment(20);
  }

  // Show feedback dialog after processing the score
  _showFeedbackDialog(consumption);
}


void _showFeedbackDialog(int consumption) {
  String feedback;
  // Define feedback based on the consumption value
  if (consumption > 187) {
    feedback = 'Your consumption is above the average in Portugal (187 liters/day) which is already one of the worse in Europe. Start using less water in everyday tasks, to help keep mother Earth safe!';
  } else if (consumption > 145 && consumption <= 187) {
    feedback = 'You are using water at a high rate, close to the high average in Portugal and above average in the World. You should consider reducing your water consumption?';
  } else if (consumption > 100 && consumption <= 145) {
    feedback = 'Your water usage is good, better than the average person. Keep it up!';
  } else {
    feedback = 'Excellent! Your water usage is well below average. You are doing great in conserving water!';
  }

  // Show dialog with feedback
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Water Consumption Feedback'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(feedback),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showHelpDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1AA3DE).withOpacity(0.95), // Light blue background with slight opacity for elegance
          title: const Text(
            'Water Usage Help',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // White text for the title
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Shower: 8 liters/minute', style: TextStyle(color: Colors.white)),
                Text('Bath: 80 liters', style: TextStyle(color: Colors.white)),
                Text('Toilet flush: 5 liters', style: TextStyle(color: Colors.white)),
                Text('Washing machine: 50 liters/load', style: TextStyle(color: Colors.white)),
                Text('Dishwasher: 14 liters/cycle', style: TextStyle(color: Colors.white)),
                Text('Tap running: 6 liters/minute', style: TextStyle(color: Colors.white)),
                Text('Car washing (horse pipe): 250 liters', style: TextStyle(color: Colors.white)),
                Text('Car washing (bucket): 30 liters', style: TextStyle(color: Colors.white)),
                Text('\nReferences: www.ccw.org.uk', style: TextStyle(color: Colors.white, fontSize: 10)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // White text for the button
                backgroundColor: const Color(0xFF002D62), // Dark blue background for the button
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context). pop();
              },
            ),
          ],
        );
      },
    );
}



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
          child: Text(
            widget.question.question,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF002D62),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1AA3DE).withOpacity(0.2),
            border: Border.all(color: const Color(0xFF002D62), width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter liters',
                    hintStyle: const TextStyle(color: Color(0xFF002D62)),
                    fillColor: Colors.transparent,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF002D62),
                    fontWeight: FontWeight.bold,
                  ),
                  onSubmitted: _handleSubmit,
                ),
              ),
              InkWell(
                onTap: _showHelpDialog,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Color(0xFF002D62))),
                  ),
                  child: const Text(
                    'Liters',
                    style: TextStyle(
                      color: Color(0xFF002D62),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}






class AnswersList extends StatefulWidget {
  const AnswersList({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    // required this.selectedAnswerText,
  });

  final Question question;
  final void Function(Answer) onAnswerSelected;

  @override
  State<AnswersList> createState() => _AnswersListState();
}

class _AnswersListState extends State<AnswersList> {
  // final String selectedAnswerText;

  Set<String> selectedAnswers = {};
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
          child: Text(
            widget.question.question,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Color(int.parse(widget.question.color)).darken(),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.question.answers
                .map(
                  (answer) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedAnswers.contains(answer.answer)) {
                            selectedAnswers.remove(answer.answer);
                            Provider.of<ScoreModel>(context, listen: false)
                                .decrement(answer.points);
                          } else {
                            selectedAnswers.add(answer.answer);
                            Provider.of<ScoreModel>(context, listen: false)
                                .increment(answer.points);
                          }
                        });
                      },
                      child: AnswerTile(
                        text: answer.answer,
                        assetPath: 'assets/images/answers/${answer.icon}',
                        color: Color(int.parse(widget.question.color)),
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
