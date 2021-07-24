import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'models/places.dart';
import 'pages/add_place_page.dart';
import 'pages/places_overview_page.dart';

void main() => dotenv.load().then((_) => runApp(MyApp()));

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
          appBarTheme: const AppBarTheme(brightness: Brightness.dark),
        ),
        home: PlacesOverviewPage(),
        routes: {AddPlacePage.routeName: (_) => AddPlacePage()},
      ),
    );
  }
}
