import 'package:flutter/material.dart';

class PlacesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      body: const Placeholder(),
    );
  }
}
