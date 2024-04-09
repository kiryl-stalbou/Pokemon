import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';

// dart run build_runner build --delete-conflicting-outputs

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _setupGlobalErrorHandler();

  runApp(const App());
}

void _setupGlobalErrorHandler() {
  WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
    log('Top level error', error: error, stackTrace: stack);
    return true;
  };

  FlutterError.onError = (details) {
    if (!details.silent) {
      log('Top level flutter error', error: details.exception, stackTrace: details.stack);
    }
  };
}
