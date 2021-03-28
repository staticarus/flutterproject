import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Picture extends StatefulWidget {
  @override
  _Picture createState() => _Picture();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Picture extends State<Picture> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compteur n°3')),
      body: Center(
        child: SingleChildScrollView(
          child: MouseRegion(
            onEnter: _incrementEnter,
            onHover: _updateLocation,
            onExit: _incrementExit,
            child: (
              Container(
                color: Colors.lightBlueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        fit:BoxFit.contain,
                        //width: MediaQuery.of(context).size.width,
                      )//Image
                    ),//Container
                    Text(
                      'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                    ),//Text
                  ],
                ),//Column
              )//Container
            ),
          ),
        )
      ),
    );
  }
}

    