import 'package:flutter/material.dart';
import 'package:mobile/navigation/navigation.dart';
import 'package:mobile/navigation/routes.dart';

class SignInPage extends Page<void> {
  const SignInPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => SignInRoute(this);
}

class SignInRoute extends MaterialPageRoute<void> {
  SignInRoute([SignInPage? page])
      : super(
          settings: page,
          builder: (context) => const SignInScreen(),
        );
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignInScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => GoSignUpRoute().go(context),
              child: const Text('Open SignUpPage'),
            ),
            TextButton(
              onPressed: () {
                // go to SignUpPage
              },
              child: const Text('Open CalendarPage'),
            ),
          ],
        ),
      ),
    );
  }
}
