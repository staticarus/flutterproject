import 'package:flutter/material.dart';
import 'package:projet/views/DrawerCompteurs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int valuebtn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer test')),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: 
            Text('Page d\'accueil à changer par la suite,\n j\'y fais quelques tests',
                style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,)
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Texte temporaire'),
            trailing: Text('tmp1'),),
          ListTile(
            leading: Icon(Icons.perm_device_info),
            title: Text('Texte temporaire'),
            trailing: Text('tmp2')),
          ListTile(
            leading: Icon(Icons.account_tree),
            title: Text('Texte temporaire'),
            trailing: Text('tmp3')),
          Divider(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            /* replace ButtonTheme and RaisedButton because those are now deprecated, 
              doc and migrating guide : https://docs.google.com/document/d/1yohSuYrvyya5V1hB6j9pJskavCdVq9sVeTqSoEPsWH0/edit#
              need to use the new ElevatedButton as Widget, and ElevatedButton.styleFrom

              The old backgroundcolor attribute is now called 'primary' 
            */
            children: [
              ButtonTheme(minWidth: 150, height: 50, child: 
                ElevatedButton(onPressed: (){
                  setState(() {
                    valuebtn++;
                  });
                }, child: Text('Btn gauche\n        +1', style: TextStyle(fontSize: 20)), style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.green[400]),

                ),),
              ),
              Divider(indent: 40,),
              ButtonTheme(minWidth: 150, height: 50, child: 
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      valuebtn==0 ? valuebtn=0 : valuebtn--;
                    });
                  }, 
                  child: Text('Btn droite\n        -1', style: TextStyle(fontSize: 20)), 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green[400]),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(valuebtn.toString(), style: TextStyle(fontSize: 30)),
            )
          )
        ]
      ),
      drawer: DrawerCompteurs()
    );
  }
}

// final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
//   primary: Colors.green,
//   //backgroundColor: MaterialStateProperty.all<Color>(Colors.green[400])
  
//   minimumSize: Size(88, 36),
//   padding: EdgeInsets.all(5),
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(2.0)),
//   ),
// );
