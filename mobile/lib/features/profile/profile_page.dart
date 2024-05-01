import 'package:flutter/material.dart';
import 'package:mobile/auth_model.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ProfileScreen'),
            TextButton(
              onPressed: () async {
                await context.read<AuthChangeNotifier>().signOut();
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
