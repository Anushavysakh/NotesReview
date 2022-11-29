import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_project/pages/add_note.dart';
import 'package:review_project/pages/search_notes.dart';
import 'package:review_project/pages/view_note.dart';

import '../model/note.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Note? note;
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchNotes(),
            ),
          );
        },
        child: Text(
          'SearchNotes',
          style: TextStyle(color: Colors.white),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(children: [
        FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No notes'));
              }
              return Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Map? data = snapshot.data!.docs[index].data() as Map?;
                    return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => ViewNote(
                                      data: data![index],
                                      ref: snapshot
                                          .data!.docs[index].reference)))
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Card(
                          child: Text(data?['title']),
                        ));
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ]),
    );
  }
}
