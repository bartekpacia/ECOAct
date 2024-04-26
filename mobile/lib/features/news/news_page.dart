import 'package:flutter/material.dart';
import 'package:mobile/score_model.dart';
import 'package:provider/provider.dart';


class NewsPage extends Page<void> {
  const NewsPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => NewsRoute(this);
}

class NewsRoute extends MaterialPageRoute<void> {
  NewsRoute([NewsPage? page])
      : super(
    settings: page,
    builder: (context) => const NewsScreen(),
  );
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News, Tips and More')),
      body: const Center(child: Text('News and Tips Screen')),
    );
  }
}