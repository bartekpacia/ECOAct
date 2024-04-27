// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $goSignInRoute,
      $goSignUpRoute,
      $goHomeShellRouteData,
    ];

RouteBase get $goSignInRoute => GoRouteData.$route(
      path: '/sign_in',
      factory: $GoSignInRouteExtension._fromState,
    );

extension $GoSignInRouteExtension on GoSignInRoute {
  static GoSignInRoute _fromState(GoRouterState state) => GoSignInRoute();

  String get location => GoRouteData.$location(
        '/sign_in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $goSignUpRoute => GoRouteData.$route(
      path: '/sign_up',
      factory: $GoSignUpRouteExtension._fromState,
    );

extension $GoSignUpRouteExtension on GoSignUpRoute {
  static GoSignUpRoute _fromState(GoRouterState state) => GoSignUpRoute();

  String get location => GoRouteData.$location(
        '/sign_up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $goHomeShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: GoHomeShellRouteData.$restorationScopeId,
      navigatorContainerBuilder:
          GoHomeShellRouteData.$navigatorContainerBuilder,
      factory: $GoHomeShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: CalendarBranchData.$navigatorKey,
          restorationScopeId: CalendarBranchData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/calendar',
              factory: $GoCalendarRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'quiz',
                  factory: $GoQuizRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: ProfileBranchData.$navigatorKey,
          restorationScopeId: ProfileBranchData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $GoProfileRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: ScoreBranchData.$navigatorKey,
          restorationScopeId: ScoreBranchData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/score',
              factory: $GoScoreRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: NewsBranchData.$navigatorKey,
          restorationScopeId: NewsBranchData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/news',
              factory: $GoNewsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $GoHomeShellRouteDataExtension on GoHomeShellRouteData {
  static GoHomeShellRouteData _fromState(GoRouterState state) =>
      const GoHomeShellRouteData();
}

extension $GoCalendarRouteExtension on GoCalendarRoute {
  static GoCalendarRoute _fromState(GoRouterState state) => GoCalendarRoute();

  String get location => GoRouteData.$location(
        '/calendar',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GoQuizRouteExtension on GoQuizRoute {
  static GoQuizRoute _fromState(GoRouterState state) => GoQuizRoute();

  String get location => GoRouteData.$location(
        '/calendar/quiz',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GoProfileRouteExtension on GoProfileRoute {
  static GoProfileRoute _fromState(GoRouterState state) => GoProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GoScoreRouteExtension on GoScoreRoute {
  static GoScoreRoute _fromState(GoRouterState state) => GoScoreRoute();

  String get location => GoRouteData.$location(
        '/score',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GoNewsRouteExtension on GoNewsRoute {
  static GoNewsRoute _fromState(GoRouterState state) => GoNewsRoute();

  String get location => GoRouteData.$location(
        '/news',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
