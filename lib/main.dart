import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as WebFirebase;
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warranty_watch/helper/theme.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:warranty_watch/services/local_storage/key_value_storage_base.dart';

void main() async {
  debugPrint = setDebugPrint;
  runApp(MyApp());

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyBEwL1W6QKkyejpgTBpGYeZhxOGjinwYvA',
        appId: '1:750770499610:web:86c8070ac5bc7a6fe6e1a3',
        messagingSenderId: '750770499610',
        projectId: 'warranty-watch'),
  );
  await KeyValueStorageBase.init();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
}

void setDebugPrint(String? message, {int? wrapWidth}) {
  final date = clock.now();
  var msg = '${date.year}/${date.month}/${date.day}';
  msg += ' ${date.hour}:${date.minute}:${date.second}';
  msg += ' $message';
  debugPrintSynchronously(
    msg,
    wrapWidth: wrapWidth,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.mainTheme,
        title: 'Warranty Watch',
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
