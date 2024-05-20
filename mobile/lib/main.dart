import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/state/auth_change_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider<AuthChangeNotifier>(
      create: (_) => AuthChangeNotifier(auth: FirebaseAuth.instance),
      child: const App(),
    ),
  );
}
