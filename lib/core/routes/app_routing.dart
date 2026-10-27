import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/auth/login/screens/login_screen.dart';
import '../../features/auth/sign_up/screens/sign_up_screen.dart';
import '../../features/main_navigation/screens/main_navigation_screen.dart';
import '../../features/details/screens/product_details_screen.dart';
import '../../features/home/service/models/product_model.dart';
import '../../features/home/service/home_service.dart';
import '../network/api_client.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String mainNavigation = '/main';
  static const String productDetails = '/product/:id';

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
          // If passed as extra object in-app
          if (state.extra is productModel) {
            return ProductDetailsScreen(productModels: state.extra as productModel);
          }

          // Otherwise fetch product by ID from path parameter
          final String? idStr = state.pathParameters['id'];
          final int? id = int.tryParse(idStr ?? '');

          if (id == null) {
            return const Scaffold(
              body: Center(child: Text('Invalid product ID')),
            );
          }

          final homeService = HomeService(ApiClient());

          return FutureBuilder<productModel>(
            future: homeService.getProductById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError || !snapshot.hasData) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Error')),
                  body: Center(
                    child: Text(snapshot.error?.toString() ?? 'Product not found'),
                  ),
                );
              }
              return ProductDetailsScreen(productModels: snapshot.data!);
            },
          );
        },
      ),
    ],
  );
}
