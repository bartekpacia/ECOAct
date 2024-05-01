import 'package:flutter/material.dart';

class EcologicalTipsPage extends Page<void> {
  const EcologicalTipsPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => EcologicalTipsRoute(this);
}

class EcologicalTipsRoute extends MaterialPageRoute<void> {
  EcologicalTipsRoute([EcologicalTipsPage? page])
      : super(
          settings: page,
          builder: (context) => const EcologicalTipsScreen(),
        );
}

class EcologicalTipsScreen extends StatelessWidget {
  const EcologicalTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecological Tips and Facts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          EcologicalTipCard(
            title: 'Reduce, Reuse, Recycle',
            category: 'Waste Management',
            description:
                'Reduce your waste production, reuse items when possible, and recycle materials to minimize environmental impact.',
          ),
          SizedBox(height: 16),
          EcologicalTipCard(
            title: 'Conserve Water',
            category: 'Water Conservation',
            description:
                'Turn off taps while brushing teeth, fix leaks, and install water-efficient appliances to conserve water resources.',
          ),
          SizedBox(height: 16),
          EcologicalTipCard(
            title: 'Switch to Renewable Energy',
            category: 'Energy Conservation',
            description:
                'Use renewable energy sources like solar or wind power to reduce dependence on fossil fuels and lower carbon emissions.',
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class EcologicalTipCard extends StatelessWidget {
  const EcologicalTipCard({
    super.key,
    required this.title,
    required this.category,
    required this.description,
  });
  final String title;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: $category',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
