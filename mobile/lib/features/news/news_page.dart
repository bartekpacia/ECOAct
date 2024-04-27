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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Ecological Tips and Facts',
                  style: TextStyle(
                  color: Color(0xFF0B610B),
                  fontWeight: FontWeight.bold,
                  fontSize:22,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 100),
                backgroundColor: Color(0xFF7EDA64),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('News of our Planet',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize:22,
              ),
            ),
             style: ElevatedButton.styleFrom(
             minimumSize: const Size(300, 100),
             backgroundColor: Color(0xFF0B610B),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
              ),
            ),
           ),
          ],
        ),
      ),
    );
  }
}