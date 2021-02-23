import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'light_theme.dart';
import 'locations.dart';

void main() {
  initializeDateFormatting('pt_BR');
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Victorious',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerDelegate: BeamerRouterDelegate(
        initialLocation: HomeLocation(),
      ),
      routeInformationParser: BeamerRouteInformationParser(
        beamLocations: [
          HomeLocation(),
          QuemSomosLocation(),
          FightersLocation(),
          CalendarLocation(),
          VideosLocation(),
          BlogLocation(),
          ContactLocation(),
        ],
      ),
    );
  }
}
