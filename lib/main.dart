import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/statitics.dart';
import 'package:finance_app/widgets/bottomnavigatorbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}


