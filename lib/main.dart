import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testekobe/app/app_widget.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(AppWidget());
    },
    (error, stack) {
      // Handle uncaught errors here
      log('Uncaught error: $error');
    },
  );
}
