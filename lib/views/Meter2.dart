import 'package:flutter/material.dart';

class Meter2 extends StatefulWidget {
  @override
  _Meter2State createState() => _Meter2State();
}

class _Meter2State extends State<Meter2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur n°2')),
      body: Center(
        child: Text('Page du compteur 2 \n\n À faire : \n (1) SingleChildScrollView \n (2) Table Data \n (3) Chart',
        style: TextStyle(fontSize: 20))
      ),
    );
  }
}