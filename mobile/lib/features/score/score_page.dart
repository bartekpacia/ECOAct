import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('ScoreScreen')),
      body: const Center(child: Text('Score:')),
    );
  }
}
