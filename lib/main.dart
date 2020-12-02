import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:victorious/page/fighters/fighters_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FightersPage(),
    );
  }
}