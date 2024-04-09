import 'dart:developer';

import 'package:flutter/material.dart';

import 'core/router/router.dart';

// dart run build_runner build --delete-conflicting-outputs

void main() {
  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    log('Top level error', error: error, stackTrace: stack);

    return true;
  };

  FlutterError.onError = (details) {
    if (!details.silent) {
      log('Top level flutter error', error: details.exception, stackTrace: details.stack);
    }
  };

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      );
}
