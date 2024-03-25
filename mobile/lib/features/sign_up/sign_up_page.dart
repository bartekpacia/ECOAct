import 'package:flutter/material.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/widgets/widgets.dart';

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
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        child: Align(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(42),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.public,
                    size: 100,
                    color: context.colorScheme.onBackground,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Welcome to ',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [
                        TextSpan(
                          text: 'ECO',
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(text: 'Act'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 14),
                      const EcoTextField(hintText: 'Email'),
                      const SizedBox(height: 14),
                      const EcoTextField(hintText: 'Name'),
                      const SizedBox(height: 14),
                      const EcoTextField(hintText: 'Username'),
                      const SizedBox(height: 14),
                      const EcoTextField(password: true, hintText: 'Password'),
                      const SizedBox(height: 14),
                      const EcoTextField(
                        password: true,
                        hintText: 'Repeat password',
                      ),
                      const SizedBox(height: 14),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0XFF2B6112),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: EcoButton(
                      text: 'Sign up',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 18),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(color: Color(0XFF79BE68)),
                  ),
                  const SizedBox(height: 21),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
