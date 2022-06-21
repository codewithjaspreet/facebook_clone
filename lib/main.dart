import 'package:facebook_clone/palette.dart';
import 'package:facebook_clone/screens/home.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
        primarySwatch: Colors.blue,
      ),
      home: NavScreen(),
    );
  }
}
