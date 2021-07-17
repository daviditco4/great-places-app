import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/places.dart';
import 'pages/add/add_place_page.dart';
import 'pages/view/places_overview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Places(),
      child: MaterialApp(
        title: 'Great Places App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amberAccent,
        ),
        home: PlacesOverviewPage(),
        routes: {AddPlacePage.routeName: (_) => AddPlacePage()},
      ),
    );
  }
}
