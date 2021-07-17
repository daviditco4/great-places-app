import 'package:flutter/material.dart';

import '../add/add_place_page.dart';

class PlacesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacePage.routeName);
            },
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
