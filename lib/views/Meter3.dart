import 'package:flutter/material.dart';

class Meter3 extends StatefulWidget {
  @override
  _Meter3State createState() => _Meter3State();
}

class _Meter3State extends State<Meter3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur n°3')),
      body: Center(
        child: Text('Page du compteur 3 \n\n À faire : \n (1) SingleChildScrollView \n (2) Table Data \n (3) Chart',
        style: TextStyle(fontSize: 20))
      ),
    );
  }
}