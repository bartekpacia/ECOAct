import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/calendar/calendar_page.dart';
import 'package:mobile/features/home/home_page.dart';
import 'package:mobile/features/profile/profile_page.dart';
import 'package:mobile/features/score/score_page.dart';
import 'package:mobile/features/quiz/quiz_page.dart';
import 'package:mobile/features/sign_in/sign_in_page.dart';
import 'package:mobile/features/sign_up/sign_up_page.dart';

part 'routes.g.dart';

const signInRouteLocation = '/sign_in';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final _sectionANavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'sectionANav',
);

@TypedGoRoute<GoSignInRoute>(path: '/sign_in')
class GoSignInRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

@TypedGoRoute<GoSignUpRoute>(path: '/sign_up')
class GoSignUpRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedStatefulShellRoute<GoHomeShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<CalendarBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GoCalendarRoute>(
          path: '/calendar',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<GoQuizRoute>(path: 'quiz'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ProfileBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GoProfileRoute>(
          path: '/profile',
        ),
      ],
    ),
    TypedStatefulShellBranch<ScoreBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GoScoreRoute>(
          path: '/score',
        ),
      ],
    ),
  ],
)
class GoHomeShellRouteData extends StatefulShellRouteData {
  const GoHomeShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

class CalendarBranchData extends StatefulShellBranchData {
  const CalendarBranchData();
}
class ScoreBranchData extends StatefulShellBranchData {
  const ScoreBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _sectionANavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';

}

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _sectionANavigatorKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class GoCalendarRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CalendarPage();
  }
}

class GoQuizRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const QuizPage();
  }
}

class GoProfileRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}


class GoScoreRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const ScorePage();
  }
}
