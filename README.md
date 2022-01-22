# Great Places App

This app lets you save the location, name and photo of your favorite places.
Also, this is the fifth Flutter app I made in Academind's Flutter & Dart course.

Links to the course:

* On Udemy.com - [Flutter & Dart - The Complete Guide](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)
* On Academind.com - [Learn Flutter & Dart to Build iOS & Android Apps](https://pro.academind.com/p/learn-flutter-dart-to-build-ios-android-apps-2020)

## Concepts used during development

* Using the image picker & device camera
  * The "File" class
  * Saving an image to long-term storage (on the device)
* Storing & fetching data with SQLite (on the device)
  * SQL vs. NoSQL (use cases, best practices & scalability)
  * Databases & tables
  * Queries
* Getting the device's location coordinates
  * Viewing other parameters (altitude, speed, accuracy, etc.)
* Displaying a static map snapshot with the Google Maps Static API
* Rendering a dynamic map with the Google Maps SDK
  * Allowing users to pick a location on the map
* Fetching a human-readable address from map coordinates (and vice versa) with the Google Geocoding API
* Using environment variables to hide secret API keys from the public

## Getting Started

Read this for downloading and installing the app from your mobile device.

### Prerequisites

You'll need:

```
- Android KitKat or later (version 4.4W, API level 20).

- Installation of apps from unknown sources permitted (see the "Setting up your device"
section at https://www.cnet.com/tech/mobile/how-to-install-apps-outside-of-google-play/).

- The application's binary file (download from the "Releases" section in this project's
GitHub repository home page), then begin the installation by opening the file.
```

### How to use

1. Open the app.
2. Tap the "+" icon at the upper-right corner of the screen for adding a new place.
3. Enter a title, image and location of the place you want to create.
4. Tap "Add Place" at the lower-right corner of the screen.
5. Tap the list item with the place you just created.
6. Tap "View On Map".

Screenshots:

<p float="left">
  <img alt="App Screenshot 1" src="/dev_assets/images/app_screenshot_1.png" width="250" />
  <img alt="App Screenshot 2" src="/dev_assets/images/app_screenshot_2.png" width="250" />
  <img alt="App Screenshot 3" src="/dev_assets/images/app_screenshot_3.png" width="250" />
  <img alt="App Screenshot 4" src="/dev_assets/images/app_screenshot_4.png" width="250" />
  <img alt="App Screenshot 5" src="/dev_assets/images/app_screenshot_5.png" width="250" />
  <img alt="App Screenshot 6" src="/dev_assets/images/app_screenshot_6.png" width="250" />
  <img alt="App Screenshot 7" src="/dev_assets/images/app_screenshot_7.png" width="250" />
  <img alt="App Screenshot 8" src="/dev_assets/images/app_screenshot_8.png" width="250" />
  <img alt="App Screenshot 9" src="/dev_assets/images/app_screenshot_9.png" width="250" />
</p>

## Built with

* [Dart 2.13.4](https://dart.dev/) - The programming language used
* [provider 6.0.0](https://pub.dev/packages/provider) - State management package

## Authors

* **David Itcovici** - [LinkedIn](https://www.linkedin.com/in/david-itcovici/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
