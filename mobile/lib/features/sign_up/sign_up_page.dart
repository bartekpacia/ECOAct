import 'package:flutter/material.dart';

class SignUpPage extends Page<void> {
  const SignUpPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => SignUpRoute(this);
}

class SignUpRoute extends MaterialPageRoute<void> {
  SignUpRoute([SignUpPage? page])
      : super(
          settings: page,
          builder: (context) => const SignUpScreen(),
        );
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUpScreen')),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('go back to SignInPage'),
        ),
      ),
    );
  }
}
