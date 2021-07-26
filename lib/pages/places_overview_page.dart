import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/places.dart';
import 'add_place_page.dart';
import 'place_details_page.dart';

class PlacesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final mediaQuery = MediaQuery.of(context);
    final portraitMode = (mediaQuery.orientation == Orientation.portrait);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => navigator.pushNamed(AddPlacePage.routeName),
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
                                leading: SizedBox.fromSize(
                                  size: const Size.square(50.0),
                                  child: Image.file(
                                    place.image,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.medium,
                                  ),
                                ),
                                title: Text(place.title, maxLines: 1),
                                subtitle: Text(
                                  '${place.location}',
                                  maxLines: portraitMode ? 2 : 1,
                                ),
                                trailing: const Icon(Icons.info_outline),
                                onTap: () {
                                  navigator.pushNamed(
                                    PlaceDetailsPage.routeName,
                                    arguments: place.id,
                                  );
                                },
                                isThreeLine: portraitMode,
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
