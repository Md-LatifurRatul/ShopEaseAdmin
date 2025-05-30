import 'package:flutter/material.dart';
import 'package:shop_ease_admin/features/views/auth/screens/login_screen.dart';
import 'package:shop_ease_admin/features/views/dashboard/screens/dashboard_screen.dart';

class AppRouter {
  static const String login = "/";
  static const String dashboard = "/dashboard";
  static const String banners = "/banners";
  static const String products = "/products";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      // case banners:
      //   return MaterialPageRoute(builder: (_) => const BannerScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Defined"))),
        );
    }
  }
}
