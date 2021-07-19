import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/places.dart';
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
                                final place = placesValues[index];

                                return ListTile(
                                  onTap: () {},
                                  leading: SizedBox.fromSize(
                                    size: const Size.square(50.0),
                                    child: Image.file(
                                      place.image,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.medium,
                                    ),
                                  ),
                                  title: Text(place.title),
                                  subtitle: Text('${place.location}'),
                                  trailing: const Icon(Icons.info_outline),
                                );
                              },
                              separatorBuilder: (_, __) => const Divider(),
                            );
                    },
                  );
          }),
    );
  }
}
