// /signup is a top level route
// not a child of /home
// The redirect blocks every path that starts with /home when the user is not logged in
// If signup was under /home a new user without an account would be sent back
// to /login and could never reach the signup page

import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'products_page.dart';
import 'signup_page.dart';
import 'test.dart';

final router = GoRouter(
  initialLocation: "/login",
  redirect: (context, state) {
    var path = state.matchedLocation;
    if (path.startsWith("/home") && !Database.isLoggedIn) {
      return "/login";
    }
    return null;
  },
  routes: [
    GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
    GoRoute(path: "/signup", builder: (context, state) => const SignupPage()),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'products',
          builder: (context, state) => const ProductsPage(),
        ),
      ],
    ),
  ],
);
