import 'package:flutter/material.dart';
import 'package:projet/views/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(FlutterFire());
}

// Initialisation de FlutterFire
class FlutterFire extends StatefulWidget {
  _FlutterFireState createState() => _FlutterFireState();
}

class _FlutterFireState extends State<FlutterFire> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      print('Erreur lors de l\'initialisation de FlutterFire. (0)');
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return loading();
    }
    print('FlutterFire est correctement initialisé ! (1)');
    return MyApp();
  }

  loading(){
    return CircularProgressIndicator(
      strokeWidth: 5,
    );
  }
}


// Si Initialisation réussie, lancement de l'application principale
class MyApp extends StatelessWidget {
  // Root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,        
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Home(title: 'Flutter Demo Home Page'),
      home: HomePage(),
    );
  }
}
