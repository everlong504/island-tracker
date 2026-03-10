import 'package:flutter/material.dart';
import 'package:island_water_impulsadores/screens/login_screen.dart';
import 'package:island_water_impulsadores/design/design_template.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}
