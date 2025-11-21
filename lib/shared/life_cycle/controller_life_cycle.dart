import 'package:flutter/widgets.dart';

mixin ControllerLifeCycle {
  void onInit([Map<String, dynamic>? params]) {}
  void onReady(BuildContext context) {}
  void onDispose() {}
}
