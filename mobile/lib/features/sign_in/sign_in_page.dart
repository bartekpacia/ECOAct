import 'package:flutter/material.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/widgets/text_field.dart';

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
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        child: Align(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.7,
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
                      Text('Sign in', style: context.textTheme.titleMedium),
                      const SizedBox(height: 6),
                      const EcoTextField(hintText: 'Email'),
                      const SizedBox(height: 6),
                      const EcoTextField(password: true, hintText: 'Password'),
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
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0XFF173309),
                        ),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () => GoSignUpRoute().push<void>(context),
                  //   child: const Text('Open SignUpPage'),
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     // go to SignUpPage
                  //   },
                  //   child: const Text('Open CalendarPage'),
                  // ),
                  const SizedBox(height: 18),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(color: Color(0XFF79BE68)),
                  ),
                  const SizedBox(height: 21),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.textTheme.labelSmall,
                      children: const [
                        TextSpan(
                          text: 'Not on ECOAct yet? ',
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(
                          text: 'Create an account here',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
