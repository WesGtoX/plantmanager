import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:plantmanager/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppWidget());
}
