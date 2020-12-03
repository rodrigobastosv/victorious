import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'light_theme.dart';
import 'page/home/home_page.dart';

void main() {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: HomePage(),
    );
  }
}
