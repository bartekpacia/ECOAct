import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/navigation/routes.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/widgets/widgets.dart';

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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailTextEditingController;
  late final TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

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
                      Text('Sign in', style: context.textTheme.titleLarge),
                      const SizedBox(height: 6),
                      EcoTextField(
                        controller: _emailTextEditingController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 6),
                      EcoTextField(
                        controller: _passwordTextEditingController,
                        password: true,
                        hintText: 'Password',
                      ),
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
                      text: 'Sign in',
                      onPressed: () {
                        final emailOk = _emailTextEditingController.text ==
                            'example@example.com';
                        final passwordOk =
                            _passwordTextEditingController.text == 'correct';

                        print('email: ${_emailTextEditingController.text}');
                        print(
                          'password: ${_passwordTextEditingController.text}',
                        );
                        print('emailOk: $emailOk, passwordOk: $passwordOk');

                        if (emailOk && passwordOk) {
                          GoCalendarRoute().push<void>(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid email or password'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(color: Color(0XFF79BE68)),
                  ),
                  const SizedBox(height: 21),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: context.textTheme.labelMedium,
                      children: [
                        const TextSpan(
                          text: 'Not on ECOAct yet? ',
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(
                          text: 'Create an account here',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => GoSignUpRoute().push<void>(context),
                          style: const TextStyle(
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
