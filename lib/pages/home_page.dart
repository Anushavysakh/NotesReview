import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_project/pages/add_note.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNote(),
          ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(children: [
        FutureBuilder(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text('NO notes'));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map? data = snapshot.data?.docs[index].data() as Map?;
                  return const Card(
                    child: Text(''),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ]),
    );
  }
}

class ViewNote {}
