import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/auth/login/screens/login_screen.dart';
import '../../features/auth/sign_up/screens/sign_up_screen.dart';
import '../../features/main_navigation/screens/main_navigation_screen.dart';
import '../../features/details/screens/product_details_screen.dart';
import '../../features/home/service/models/product_model.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String mainNavigation = '/main';
  static const String productDetails = '/product-details';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: mainNavigation,
        builder: (context, state) => const MainNavigationScreen(),
      ),
      GoRoute(
        path: productDetails,
        builder: (context, state) {
          final product = state.extra as productModel?;
          if (product == null) {
            return const Scaffold(
              body: Center(child: Text('Product not found')),
            );
          }
          return ProductDetailsScreen(productModels: product);
        },
      ),
    ],
  );
}
