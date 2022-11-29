import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_project/pages/search_notes.dart';

import '../model/note.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> noteList = [];
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Notes'),
          leading: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchNotes(),
                ),
              );
            },
            child: Text('SearchNotes'),
          )),
      body: Container(
        child: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return const Card(

            );

          },
        ),
      ),

      //floatingActionButton: ,
    );
  }
}
