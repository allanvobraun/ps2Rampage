import 'package:flutter/material.dart';
import 'package:ps2_rampage/ui/app.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WindowManager.instance.setTitle('Ps2 Rampage');
  runApp(const App());
}
