import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/places.dart';
import 'add_place_page.dart';

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
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).pull(),
        builder: (_, snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? const Center(child: CircularProgressIndicator())
              : Consumer<Places>(
                  child: const Center(
                    child: Text('Start adding great places!'),
                  ),
                  builder: (_, places, child) {
                    final placesValues = places.values;

                    return placesValues.isEmpty
                        ? child!
                        : ListView.separated(
                            itemCount: placesValues.length,
                            itemBuilder: (_, index) {
                              final plce = placesValues[index];

                              return ListTile(
                                leading: SizedBox.fromSize(
                                  size: const Size.square(50.0),
                                  child: Image.file(
                                    plce.image,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.medium,
                                  ),
                                ),
                                title: Text(plce.title, maxLines: 1),
                                subtitle: Text('${plce.location}', maxLines: 2),
                                trailing: const Icon(Icons.info_outline),
                                onTap: () {},
                                isThreeLine: true,
                              );
                            },
                            separatorBuilder: (_, __) {
                              return const Divider(height: 0.0);
                            },
                          );
                  },
                );
        },
      ),
    );
  }
}
