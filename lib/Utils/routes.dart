import 'package:general_counsel/Views/authentication/sign_in.dart';
import 'package:general_counsel/Views/authentication/sign_up.dart';
import 'package:general_counsel/Views/dashboard/dashboard.dart';
import 'package:general_counsel/Views/home/cases_view.dart';
import 'package:general_counsel/Views/onboarding/onbording.dart';
import 'package:general_counsel/main.dart';
import 'package:go_router/go_router.dart';

class RoutesConfig {
// GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name:
            'splash', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name:
            'onboarding', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        name: 'signIn',
        path: '/signIn',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        builder: (context, state) => DashBoardView(),
      ),
      GoRoute(
        name: 'cases',
        path: '/cases',
        builder: (context, state) => const CasesView(),
      ),
    ],
  );
}
