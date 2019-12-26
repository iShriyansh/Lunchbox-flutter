import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Dbl extends StatelessWidget {



  final databaseReference = Firestore.instance;
  void createRecord() async {
    await databaseReference.collection("books")
        .document("1")
        .setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

    DocumentReference ref = await databaseReference.collection("books")
        .add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    },

    );

    print(ref.documentID);
  }


  void getData() {
    databaseReference
        .collection("foodProvider")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Center(
       child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                MaterialButton(
                    color: Colors.red,
                    onPressed: (){

   createRecord();

                    },
                    child: Text("setting Data"),

                ),

                MaterialButton(
                  color: Colors.red,
                  onPressed: (){

                  getData();

                  },
                  child: Text("getting Data"),

                ),



              ],
            ),
          ),

        ),
     ),
    );
  }
}
