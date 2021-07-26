import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/places.dart';
import 'map_page.dart';

class PlaceDetailsPage extends StatelessWidget {
  static const routeName = 'place-details';

  @override
  Widget build(BuildContext context) {
    final placeId = ModalRoute.of(context)!.settings.arguments as String;
    final place = Provider.of<Places>(context, listen: false).findById(placeId);
    final theme = Theme.of(context);
    const verticalSpace = SizedBox(height: 20.0);

    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(
              place.image,
              width: double.infinity,
              height: 309.0,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
            verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '${place.location}',
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: theme.textTheme.headline6,
              ),
            ),
            verticalSpace,
            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('View On Map'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) {
                      return MapPage(
                        selectingEnabled: false,
                        initialTargetLocation: place.location,
                      );
                    },
                  ),
                );
              },
            ),
            verticalSpace,
          ],
        ),
      ),
    );
  }
}
