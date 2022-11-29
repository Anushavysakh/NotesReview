import 'package:flutter/material.dart';
import 'package:review_project/firebase_note_service.dart';

import '../model/note.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? title;
  String? description;

  void add() {
    FirebaseNoteService.addNote(title!, description!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => add(),
            child: Text(
              'save',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          onChanged: (value) {
            title = value;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Description'),
          onChanged: (value) {
            description = value;
          },
        ),
      ]),
    );
  }
}
