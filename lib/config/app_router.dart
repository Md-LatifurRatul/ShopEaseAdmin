import 'package:flutter/material.dart';
import 'package:shop_ease_admin/features/views/auth/screens/login_screen.dart';

class AppRouter {
  static const String login = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text("404 | Page Not Found")),
              ),
        );
    }
  }
}
