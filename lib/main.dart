import 'package:flutter/material.dart';

import 'pages/view/places_overview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amberAccent,
      ),
      home: PlacesOverviewPage(),
      routes: {},
    );
  }
}
