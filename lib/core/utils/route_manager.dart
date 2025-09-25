import 'package:flutter/material.dart';
import 'package:smpd_fee_mate_app/features/authentication/presentation/screens/welcome_screen.dart';
// import 'package:split_and_share/features/authentication/presentation/screens/login_screen.dart';
// import 'package:split_and_share/features/welcome/presentation/welcome_screen.dart';

// import '../../authentication/presentation/screens/reset_password_screen.dart';
// import '../../authentication/presentation/screens/sign_up_screen.dart';
// import '../../home/presentation/home_page.dart';

class RouteManager {
  static const String intro = '/';
  static const String login = '/login';
  static const String errorPage = '/error';
  static const String signUp = "/signup";
  static const String resetPassword = "/resetPassword";
  static const String errorPageMessage = 'No page found';
  static const String homePage = "/home";
  static const String welcomPage = "/welcome";
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  RouteManager(this.scaffoldMessengerKey);

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case welcomPage:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      // case login:
      //   return MaterialPageRoute(builder: (_) => Login(scaffoldMessengerKey: scaffoldMessengerKey,));
      // case homePage:
      //   return MaterialPageRoute(builder: (_) => NavigationMenu());
      // case signUp:
      //   return MaterialPageRoute(builder: (_) => SignUp(scaffoldMessengerKey: scaffoldMessengerKey,));
      // case resetPassword:
      //   return MaterialPageRoute(builder: (_) => ResetPassword(scaffoldMessengerKey: scaffoldMessengerKey,));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(errorPageMessage),
            ),
          ),
        );
    }
  }
}
