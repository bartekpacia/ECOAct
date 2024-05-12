import 'package:flutter/material.dart';
import 'package:mobile/state/auth_change_notifier.dart';
import 'package:provider/provider.dart';

class ProfilePage extends Page<void> {
  const ProfilePage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => ProfileRoute(this);
}

class ProfileRoute extends MaterialPageRoute<void> {
  ProfileRoute([ProfilePage? page])
      : super(
          settings: page,
          builder: (context) => const ProfileScreen(),
        );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authChangeNotifier = context.read<AuthChangeNotifier>();
    final user = authChangeNotifier.user!;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username : ${user.displayName} \n  \nEmail : ${user.email}\n  \n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            TextButton(
              onPressed: () async {
                await context.read<AuthChangeNotifier>().signOut();
              },
              child: const Text('Sign out',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
