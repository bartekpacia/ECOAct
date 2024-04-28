import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/navigation/routes.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                  GoEcologicalTipsRoute().push<void>(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 100),
                backgroundColor: const Color(0xFF7EDA64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Ecological Tips and Facts',
                style: TextStyle(
                  color: Color(0xFF0B610B),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                GoPlanetNewsRoute().push<void>(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 100),
                backgroundColor: const Color(0xFF0B610B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'News of our Planet',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
