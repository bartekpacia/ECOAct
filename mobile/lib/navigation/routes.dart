import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/calendar/calendar_page.dart';
import 'package:mobile/features/ecological_tips_and_facts/ecological_tips_page.dart';
import 'package:mobile/features/home/home_page.dart';
import 'package:mobile/features/news/news_page.dart';
import 'package:mobile/features/planet_news/planet_news_page.dart';
import 'package:mobile/features/profile/profile_page.dart';
import 'package:mobile/features/quiz/quiz_page.dart';
import 'package:mobile/features/score/score_page.dart';
import 'package:mobile/features/sign_in/sign_in_page.dart';
import 'package:mobile/features/sign_up/sign_up_page.dart';
import 'package:mobile/navigation/navigation.dart';

part 'routes.g.dart';

const signInRouteLocation = '/sign_in';
const calendarRouteLocation = '/calendar';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final _calendarNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'calendarBranchNavigator',
);

final _profileNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'profileBranchNavigator',
);

final _scoreNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'scoreBranchNavigator',
);

final _newsNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'newsBranchNavigator',
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
          path: calendarRouteLocation,
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<GoQuizRoute>(path: 'quiz/:dateId'),
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
    TypedStatefulShellBranch<NewsBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<GoNewsRoute>(
          path: '/news',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<GoPlanetNewsRoute>(path: 'planet_news_page.dart'),
            TypedGoRoute<GoEcologicalTipsRoute>(
              path: 'ecological_tips_page.dart',
            ),
          ],
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

  static final GlobalKey<NavigatorState> $navigatorKey = _calendarNavigatorKey;
  static const String $restorationScopeId = 'calendarRestorationScopeId';
}

class ScoreBranchData extends StatefulShellBranchData {
  const ScoreBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _scoreNavigatorKey;
  static const String $restorationScopeId = 'scoreRestorationScopeId';
}

class NewsBranchData extends StatefulShellBranchData {
  const NewsBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _newsNavigatorKey;
  static const String $restorationScopeId = 'newsRestorationScopeId';
}

class ProfileBranchData extends StatefulShellBranchData {
  const ProfileBranchData();

  static final GlobalKey<NavigatorState> $navigatorKey = _profileNavigatorKey;
  static const String $restorationScopeId = 'profileRestorationScopeId';
}

class GoCalendarRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CalendarPage();
  }
}

class GoQuizRoute extends GoRouteData {
  const GoQuizRoute({required this.dateId});

  final String dateId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return QuizPage(dateId: dateId);
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

class GoNewsRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NewsPage();
  }
}

class GoPlanetNewsRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const PlanetNewsPage();
  }
}

class GoEcologicalTipsRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const EcologicalTipsPage();
  }
}
