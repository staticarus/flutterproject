# Flutter project

Mobile app for a school project involving data from the web and charts visualizations.

External libraries used : firebase_core, cloud_firestore, syncfusion_flutter_charts


## To do
---
- ~~Pages / Navigator and basic styling~~

- ~~Receive Firebase data~~

- ~~Send data to Firebase~~

- A better understanding of widget nesting hierarchy as to not break my layouts when trying things

- Read docs to replace the deprecated RaisedButton by the new ElevatedButton (`HomePage.dart` line 41)

- use data from Firebase to automatically populate the charts (`Timer1.dart`)

- A global meter view populated according to the chosen index, instead of one specific view file for each meter (`Meter1` + `Meter2` + `Meter3`)

- Find a way to select 4 (X,Y) coordinates in a MouseRegion to crop pictures and send them to Firebase for the Rasp (`ListenerTest.dart`)


## Errors

- ~~Rendering Exception from firebase data query~~  **Corrected** : using ListView + .map().toList() to make it work