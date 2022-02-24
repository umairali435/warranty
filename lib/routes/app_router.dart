import 'package:flutter/material.dart';
import 'package:warranty_watch/routes/app_routes.dart';
import 'package:warranty_watch/screens/add_item.dart';
import 'package:warranty_watch/screens/all_items.dart';
import 'package:warranty_watch/screens/register_user.dart';
import 'package:warranty_watch/screens/sigin_in.dart';
import 'package:warranty_watch/screens/splash_screen.dart';

@immutable
class AppRouter {
  const AppRouter._();
  static const String initialRoute = Routes.watchSplashScreen;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedReplacement(String routeName,
      {dynamic args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushAndremoveUntill(String routeName, {dynamic args}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }

  static Future<void> pop([dynamic result]) async {
    navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.watchSplashScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => SplashScreen(),
            settings: RouteSettings(name: Routes.watchSplashScreen));
      case Routes.watchRegisterScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => RegisterUser(),
            settings: RouteSettings(name: Routes.watchRegisterScreen));
      case Routes.watchLoginScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => LoginScreen(),
            settings: RouteSettings(name: Routes.watchLoginScreen));
      case Routes.watchAddItemScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => AddItem(),
            settings: RouteSettings(name: Routes.watchAddItemScreen));
      case Routes.watchAllItemScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => AllItems(),
            settings: RouteSettings(name: Routes.watchAllItemScreen));
      default:
    }
  }
}
