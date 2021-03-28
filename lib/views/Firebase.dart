import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// create a new Firestore instance
FirebaseFirestore firestore = FirebaseFirestore.instance;

// Page avec état dynamique pour données en temps réel depuis Firestore
class Firebase extends StatefulWidget {
  @override
  _FirebaseState createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Firebase')),
      body:  //Center(child: CompteursInformation(),)
      CompteursInformation()

    
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Test Firebase', style: TextStyle(fontSize: 30, color: Colors.orange[300])),

      //       AddCompteur("nom prenom", "société", 25),
      //       //CompteursInformation(),

      //       Divider(height: 100, indent: 80, endIndent: 80,),
      //       Text('Test DataTable (manuel, pas de query firebase) :', style: TextStyle(fontSize: 15)),
      //       DataTable(
      //         columns: const <DataColumn>[
      //           DataColumn(
      //             label: Text('Compteur', style: TextStyle(fontSize: 18, color: Colors.green),),
      //           ),
      //           DataColumn(
      //             label: Text('Valeur', style: TextStyle(fontSize: 18, color: Colors.green),),
      //           ),
      //           DataColumn(
      //             label: Text('Timestamp', style: TextStyle(fontSize: 18, color: Colors.green),),
      //           ),
      //         ],
      //         rows: const <DataRow>[
      //           DataRow(
      //             cells: <DataCell>[
      //               DataCell(Text('Électricité')),
      //               DataCell(Text('19')),
      //               DataCell(Text('16-11-2020 10:00')),
      //             ],
      //           ),
      //           DataRow(
      //             cells: <DataCell>[
      //               DataCell(Text('Eau')),
      //               DataCell(Text('43')),
      //               DataCell(Text('16-11-2020 10:00')),
      //             ],
      //           ),
      //           DataRow(
      //             cells: <DataCell>[
      //               DataCell(Text('Gaz')),
      //               DataCell(Text('27')),
      //               DataCell(Text('16-11-2020 10:00')),
      //             ],
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

// Réception de données Firestore (BUG AVEC LE Center(Column(X) DU SCAFFOLD CI-DESSOUS DONC DESACTIVE POUR LE MOMENT)
class CompteursInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference compteurs = firestore.collection('compteurs');

    return StreamBuilder<QuerySnapshot>(
      stream: compteurs.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
          //print('Something went wrong'); 
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
          //print('Loading'); 
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['fullname']),
              subtitle: new Text(document.data()['company']),
            );
            // String textToSend = "";
            // for (var i = 0; i < snapshot.data.size; i++) {
            //   textToSend += "${document.data()['company']} ${document.data()['fullname']}";
            // }
            // return Text(textToSend);
          }).toList(),
        );
      }
    );
  }
}

// Envoi de données vers Firestore
class AddCompteur extends StatelessWidget {
  final String fullname;
  final String company;
  final int age;
  AddCompteur(this.fullname, this.company, this.age);
  
  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference compteurs = FirebaseFirestore.instance.collection('compteurs');

    // Se renseigner sur les paths pour les Collections, Subcollections, Documents
    //DocumentReference documents = FirebaseFirestore.instance.doc('documentPath');

    Future<void> addCompteur() {
      // Call the compteurs CollectionReference to add a new compteur
      return compteurs
      //.doc('Carotte')
      //.set({
      .add({  
        'fullname': fullname,
        'company': company,
        'age': age
      })
      .then((value) => print('User Added'))
      .catchError((error) => print('Failed to add compteur : $error'));
    }

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[400])
      ),
      onPressed: addCompteur,
      child: Text('Add Compteur (cela envoie des données)')
    );
  }
}
