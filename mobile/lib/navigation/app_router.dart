import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/navigation/routes.dart';

export 'package:go_router/go_router.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super.routingConfig(
          routingConfig: ValueNotifier(RoutingConfig(routes: $appRoutes)),
          initialLocation: signInRouteLocation,
          navigatorKey: rootNavigatorKey,
        );
}
