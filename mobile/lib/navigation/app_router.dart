import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/auth_model.dart';
import 'package:mobile/navigation/routes.dart';

export 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  AppRouter({
    required AuthChangeNotifier authChangeNotifier,
  }) : super.routingConfig(
          routingConfig: ValueNotifier(RoutingConfig(routes: $appRoutes)),
          initialLocation: signInRouteLocation,
          navigatorKey: rootNavigatorKey,
        ) {
    final authStreamController = StreamController<firebase_auth.User?>();
    _authSubscription = authStreamController.stream.listen((user) {
      if (user == null) {
        go(signInRouteLocation);
      } else {
        go(calendarRouteLocation);
      }
    });

    authChangeNotifier.addListener(() {
      final user = authChangeNotifier.user;
      authStreamController.add(user);
    });
  }

  StreamSubscription<void>? _authSubscription;

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
