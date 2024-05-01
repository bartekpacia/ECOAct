import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/auth_model.dart';
import 'package:mobile/emissions_model.dart';
import 'package:mobile/score_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const GlobalProviders(
      child: App(),
    ),
  );
}

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthChangeNotifier()),
        ChangeNotifierProvider(create: (context) => ScoreModel()),
        ChangeNotifierProvider(create: (context) => CarbonFootprintModel()),
        ChangeNotifierProvider(create: (context) => AnswersChangeNotifier()),
      ],
      child: child,
    );
  }
}
