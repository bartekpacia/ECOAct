import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/calendar/calendar_page.dart';
import 'package:mobile/features/quiz/quiz_page.dart';
import 'package:mobile/features/sign_in/sign_in_page.dart';
import 'package:mobile/features/sign_up/sign_up_page.dart';

part 'routes.g.dart';

const signInRouteLocation = '/sign_in';
const signUpRouteLocation = '/sign_up';
const calendarRouteLocation = '/calendar';
const quizRouteLocation = '/quiz';

@TypedGoRoute<GoSignInRoute>(path: signInRouteLocation)
class GoSignInRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

@TypedGoRoute<GoSignUpRoute>(path: signUpRouteLocation)
class GoSignUpRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedGoRoute<GoCalendarRoute>(path: calendarRouteLocation)
class GoCalendarRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CalendarPage();
  }
}

@TypedGoRoute<GoQuizRoute>(path: quizRouteLocation)
class GoQuizRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const QuizPage();
  }
}
