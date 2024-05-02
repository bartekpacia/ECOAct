import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/navigation/app_router.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/state/auth_change_notifier.dart';
import 'package:mobile/state/emissions_model.dart'; // Import CarbonFootprintModel
import 'package:mobile/state/quiz_change_notifier.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter router;

  @override
  void initState() {
    super.initState();

    router = AppRouter(
      authChangeNotifier: context.read<AuthChangeNotifier>(),
    );
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScoreModel()),
        ChangeNotifierProvider(create: (context) => CarbonFootprintModel()),
        ChangeNotifierProvider(
          create: (context) => QuizChangeNotifier(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pt')],
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
      ),
    );
  }
}
