import 'package:flutter/material.dart';
import 'package:mobile/resources/theme.dart';
import 'package:mobile/state/auth_change_notifier.dart';
import 'package:mobile/widgets/widgets.dart';
import 'package:provider/provider.dart';

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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordsDoNotMatch = false;
  bool hidePasswords = true;
  String? nameError;
  String? emailError;
  late final TextEditingController emailTextController;
  late final TextEditingController nameTextController;
  late final TextEditingController passwordTextController;
  late final TextEditingController repeatPasswordTextController;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    nameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    repeatPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    nameTextController.dispose();
    passwordTextController.dispose();
    repeatPasswordTextController.dispose();
    super.dispose();
  }

  Future<void> _onSignUpPressed(BuildContext context) async {
    final authChangeNotifier = context.read<AuthChangeNotifier>();
    final email = emailTextController.text;
    final name = nameTextController.text;
    final password = passwordTextController.text;
    final repeatPassword = repeatPasswordTextController.text;

    if (password != repeatPassword) {
      setState(() => passwordsDoNotMatch = true);
      return;
    } else {
      setState(() => passwordsDoNotMatch = false);
    }

    if (name.length < 3) {
      setState(() => nameError = 'Name too short');
      return;
    } else {
      setState(() => nameError = null);
    }

    final result = await authChangeNotifier.signUp(
      email: email,
      displayName: name,
      password: password,
    );

    if (!result && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
                      Text(
                        'Create an account',
                        style: context.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 14),
                      EcoTextField(
                        controller: emailTextController,
                        hintText: 'Email',
                        errorText: emailError,
                      ),
                      const SizedBox(height: 14),
                      EcoTextField(
                        controller: nameTextController,
                        hintText: 'Name',
                        errorText: nameError,
                      ),
                      const SizedBox(height: 14),
                      EcoTextField(
                        controller: passwordTextController,
                        password: hidePasswords,
                        hintText: 'Password',
                        errorText: !passwordsDoNotMatch
                            ? null
                            : 'Passwords do not match',
                      ),
                      const SizedBox(height: 14),
                      EcoTextField(
                        controller: repeatPasswordTextController,
                        password: hidePasswords,
                        hintText: 'Repeat password',
                        errorText: !passwordsDoNotMatch
                            ? null
                            : 'Passwords do not match',
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
                      onPressed: () => _onSignUpPressed(context),
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
