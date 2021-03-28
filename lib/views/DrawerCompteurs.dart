import 'package:flutter/material.dart';
import 'package:projet/views/Meter1.dart';
import 'package:projet/views/Meter2.dart';
import 'package:projet/views/Meter3.dart';
import 'package:projet/views/Picture.dart';
import 'package:projet/views/ListenerTest.dart';
import 'package:projet/views/Firebase.dart';

class DrawerCompteurs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Encapsule le Drawer pour largeur proportionnelle à l'écran
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width:60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/pictures/logo_firebase_color.png'),
                      )
                    ),
                    SizedBox(height: 15,),
                    Text('Nom Prénom', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                    SizedBox(height: 3,),
                    Text('Projet Flutter + Firebase', style: TextStyle(fontSize: 12, color: Colors.white))
                  ],
                )
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.flash_on, color: Colors.yellow[300],),
              title: Text('Compteur électrique', 
              //style: TextStyle(color: Colors.yellow[300])
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Meter1())),
            ),
            ListTile(
              leading: Icon(Icons.waves, color: Colors.blue[300],),
              title: Text('Compteur d\'eau', 
              //style: TextStyle(color: Colors.blue[300])
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Meter2())),
            ),
            ListTile(
              leading: Icon(Icons.local_fire_department, color: Colors.red[300],),
              title: Text('Compteur Gaz', 
              //style: TextStyle(color: Colors.red[300])
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Meter3())),
            ),
            ListTile(
              leading: Icon(Icons.photo_size_select_actual, color: Colors.purple),
              title: Text('Picture Test'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Picture())),
            ),
            ListTile(
              leading: Icon(Icons.pin_drop, color: Colors.purple),
              title: Text('Listener Test'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListenerTest())),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.miscellaneous_services),
              title: Text('Page de Test Firebase'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Firebase())),
            )
          ],
        )
      )
    );
  }
}