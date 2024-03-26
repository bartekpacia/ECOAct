// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $goSignInRoute,
      $goSignUpRoute,
      $goCalendarRoute,
      $goQuizRoute,
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

RouteBase get $goCalendarRoute => GoRouteData.$route(
      path: '/calendar',
      factory: $GoCalendarRouteExtension._fromState,
    );

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

RouteBase get $goQuizRoute => GoRouteData.$route(
      path: '/quiz',
      factory: $GoQuizRouteExtension._fromState,
    );

extension $GoQuizRouteExtension on GoQuizRoute {
  static GoQuizRoute _fromState(GoRouterState state) => GoQuizRoute();

  String get location => GoRouteData.$location(
        '/quiz',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
