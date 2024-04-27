import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import 'package:mobile/resources/theme.dart';

class PlanetNewsPage extends Page<void>{
  const PlanetNewsPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => PlanetNewsRoute(this);
}

class PlanetNewsRoute extends MaterialPageRoute<void> {
  PlanetNewsRoute([PlanetNewsPage? page])
      : super(
    settings: page,
    builder: (context) => const PlanetNewsScreen(),
  );
}

class PlanetNewsScreen extends StatelessWidget {
  const PlanetNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News of our Planet')),
      body: Center(
        child: Text('This is the new page.'),
      ),
    );
  }
}
