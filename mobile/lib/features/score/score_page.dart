import 'package:flutter/material.dart';
import 'package:mobile/emissions_model.dart';
import 'package:mobile/score_model.dart'; // Assuming you have a `ScoreModel` class
import 'package:provider/provider.dart';

class ScorePage extends Page<void> {
  const ScorePage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => ScoreRoute(this);
}

class ScoreRoute extends MaterialPageRoute<void> {
  ScoreRoute([ScorePage? page])
      : super(
          settings: page,
          builder: (context) => const ScoreScreen(),
        );
}

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Score')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CarbonFootprintModel>(
              builder: (context, model, _) {
                final userCarbonFootprint = model.carbonFootprint;
                const averageCarbonFootprint = 100; // example

                final percentage =
                    ((averageCarbonFootprint - userCarbonFootprint).abs() /
                            averageCarbonFootprint) *
                        100;

                final Color progressColor =
                    userCarbonFootprint > averageCarbonFootprint
                        ? Colors.red
                        : Colors.blue;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circular progress indicator around the Earth icon
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade100,
                      ),
                      child: CircularProgressIndicator(
                        value: percentage /
                            100, // Adjust based on your scoring system
                        strokeWidth: 12,
                        backgroundColor: Colors.grey,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(progressColor),
                      ),
                    ),
                    const Icon(
                      Icons.public,
                      size: 170,
                      color: Colors.white,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<CarbonFootprintModel>(
              builder: (context, model, _) {
                final userCarbonFootprint = model.carbonFootprint;
                const averageCarbonFootprint = 100; // example

                final percentage =
                    ((averageCarbonFootprint - userCarbonFootprint).abs() /
                            averageCarbonFootprint) *
                        100;

                String message;

                if (userCarbonFootprint > averageCarbonFootprint) {
                  message =
                      'At the moment, your carbon footprint is ${percentage.toInt()}% above average.\n'
                      'Time to improve it!';
                } else {
                  message =
                      'At the moment, your carbon footprint is ${percentage.toInt()}% below average.\n'
                      'Good job, keep going :)';
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ), // Add vertical padding
                  child: Text(
                    message,
                    textAlign: TextAlign.center, // Center the text
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'IndieFlower',
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<ScoreModel>(
              builder: (context, model, _) {
                return Text(
                  'Current score: ${model.score}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
