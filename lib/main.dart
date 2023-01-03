import 'package:flutter/material.dart';
import 'package:saark/screens/login_page.dart';
import 'package:saark/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: kPrimaryColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 20,
            ),
            bodyMedium: TextStyle(
              fontSize: 18,
            ),
            bodySmall: TextStyle(
              fontSize: 18,
            ),
          )),
      home: const LoginPage(),
    );
  }
}
