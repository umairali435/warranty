import 'dart:async';
import 'package:flutter/material.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:warranty_watch/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),
        () => AppRouter.pushNamed(Routes.watchLoginScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/app_icon.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Warranty Watch',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
